import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTopThree(),
        _buildLeaderboardList(),
      ],
    );
  }

  Widget _buildTopThree() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildTopThreeItem('Gio', '1500 EXP', 2, const Color.fromARGB(255, 240, 201, 142)),
          _buildTopThreeItem('FIKRI', '2000 EXP', 1, Colors.lightGreenAccent),
          _buildTopThreeItem('Glen', '1000 EXP', 3, Colors.pink.shade200),
        ],
      ),
    );
  }

  Widget _buildTopThreeItem(String name, String exp, int position, Color color) {
    double height = position == 1 ? 120 : position == 2 ? 100 : 80;
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundColor: Colors.grey,
        ),
        const SizedBox(height: 8),
        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 80,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
          ),
          child: Center(
            child: Text(
              position == 1 ? '1 st' : 
              position == 2 ? '2 nd' : '3 rd',
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLeaderboardList() {
    final List<Map<String, dynamic>> users = [
      {'rank': 1, 'name': 'Fikri', 'exp': '2000 POINT', 'status': 'Silver'},
      {'rank': 2, 'name': 'Gio', 'exp': '1500 EXP', 'status': 'Gold'},
      {'rank': 3, 'name': 'Glen', 'exp': '1000 EXP', 'status': 'Silver'},
      {'rank': 4, 'name': 'Sonia', 'exp': '900 EXP', 'status': 'Silver'},
      {'rank': 5, 'name': 'Safira', 'exp': '750 EXP', 'status': 'Silver'},
    ];

    return Expanded(
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 24,
                  child: Text(
                    '${user['rank']}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey[300],
                ),
              ],
            ),
            title: Text(
              user['name'],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(user['status']),
            trailing: Text(
              user['exp'],
              style: const TextStyle(
                color: Color(0xFF2E7D32),
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}