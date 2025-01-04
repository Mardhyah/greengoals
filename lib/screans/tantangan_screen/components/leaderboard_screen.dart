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
        AnimatedContainer(
          duration: Duration(seconds: 2),
          curve: Curves.easeInOut,
          width: 80,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
          ),
          child: Center(
            child: Text(
              position == 1 ? '1st' : position == 2 ? '2nd' : '3rd',
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
          return AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.easeInOut,
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              leading: CircleAvatar(
                backgroundColor: Colors.grey[300],
                radius: 25,
                child: Text(
                  '${user['rank']}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(
                user['name'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(user['status']),
              trailing: Text(
                user['exp'],
                style: const TextStyle(
                  color: Color(0xFF2E7D32),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
