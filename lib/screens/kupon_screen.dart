import 'package:flutter/material.dart';

class KuponScreen extends StatefulWidget {
  const KuponScreen({super.key});

  @override
  State<KuponScreen> createState() => _KuponScreenState();
}

class _KuponScreenState extends State<KuponScreen> {
  final List<Map<String, dynamic>> _kupons = [
    {
      'title': 'Kupon Potongan Harga Rp 10.000',
      'minBeli': 'Min. Bll Rp 30.000',
      'validity': 'Berlaku dalam: 3 Nov 24',
      'isMyKupon': false,
    },
    {
      'title': 'Kupon Potongan Harga Rp 5.000',
      'minBeli': 'Min. Bll Rp 30.000',
      'validity': 'Berlaku dalam: 6 Nov 24',
      'isMyKupon': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Kupon Ku',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Column(
              children: _kupons.map((kupon) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: _buildKuponCard(kupon),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKuponCard(Map<String, dynamic> kupon) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.card_giftcard,
                    color: Colors.green[400],
                    size: 30,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        kupon['title'],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        kupon['minBeli'],
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        kupon['validity'],
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                if (!kupon['isMyKupon'])
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _kupons.remove(kupon);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2E7D32),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                    child: const Text(
                      'Klaim',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: const BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: const Text(
                'HOT',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
