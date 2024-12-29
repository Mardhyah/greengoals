import 'package:flutter/material.dart';
import 'package:greengoals/models/tantangan.dart';
import 'package:greengoals/screens/kupon_screen.dart';
import 'package:greengoals/screens/tantangan/detail_tantangan_screen.dart'; // Pastikan import detail_tantangan_screen
import 'package:greengoals/screens/home_screen.dart';  // Import HomeScreen
import 'leaderboard_screen.dart'; // Import LeaderboardScreen

class TantanganScreen extends StatefulWidget {
  const TantanganScreen({super.key});

  @override
  State<TantanganScreen> createState() => _TantanganScreenState();
}

class _TantanganScreenState extends State<TantanganScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Tantangan> tantanganList = [
    Tantangan(
      image: 'assets/image/berkebun.jpg',
      title: 'Berkebun di Rumah',
      points: 50,
      tanggal: 'Tantangan Berlaku Sampai Tanggal 12-03-2024',
      deskripsi: 'Ajakan untuk mulai menanam tanaman di sekitar rumah guna menjaga lingkungan.',
    ),
    Tantangan(
      image: 'assets/image/diet_plastik.jpg',
      title: 'Tantangan Diet Plastik',
      points: 30,
      tanggal: 'Tantangan Berlaku Sampai Tanggal 12-03-2024',
      deskripsi: 'Kurangi penggunaan plastik sekali pakai untuk membantu mengurangi limbah.',
    ),
    Tantangan(
      image: 'assets/image/kompos.jpeg',
      title: 'Tantangan Diet Plastik',
      points: 30,
      tanggal: 'Tantangan Berlaku Sampai Tanggal 12-03-2024',
      deskripsi: 'Untuk membantu mengurangi limbah buatlah kompos organik.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E7D32),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Navigasi ke HomeScreen saat tombol panah ditekan
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
        title: const Text(
          'Tantangan',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: const Color(0xFF2E7D32),
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white.withOpacity(0.7),
              tabs: const [
                Tab(text: 'Tantangan'),
                Tab(text: 'Leaderboard'),
                Tab(text: 'Kupon'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildTantanganList(),  // Tampilan List Tantangan
                const LeaderboardScreen(),  // Halaman Leaderboard
                const KuponScreen(),  // Konten Kupon
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk menampilkan list tantangan
  Widget _buildTantanganList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: tantanganList.length,
      itemBuilder: (context, index) {
        final tantangan = tantanganList[index];
        return _buildTantanganCard(tantangan);
      },
    );
  }

  // Widget untuk card tantangan yang bisa diklik
  Widget _buildTantanganCard(Tantangan tantangan) {
    return GestureDetector(
      onTap: () {
        // Menavigasi ke halaman detail tantangan saat card diklik
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailTantanganScreen(tantangan: tantangan),
          ),
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                tantangan.image,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.image_not_supported,
                  size: 150,
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        tantangan.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${tantangan.points} POINT',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2E7D32),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    tantangan.tanggal,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    tantangan.deskripsi,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
