import 'package:flutter/material.dart';
import 'package:greengoals/models/tantangan.dart';
import 'package:greengoals/screans/tantangan_screen/components/kupon_screen.dart';
import 'package:greengoals/screans/tantangan_screen/components/leaderboard_screen.dart';
import 'package:greengoals/screans/tantangan_screen/components/detail_tantangan_screen.dart';
import 'package:greengoals/themes/color_scheme.dart';
import 'package:greengoals/themes/text_theme.dart';

class TantanganScreen extends StatefulWidget {
  static var routePath;

  const TantanganScreen({super.key});

  @override
  State<TantanganScreen> createState() => _TantanganScreenState();
}

class _TantanganScreenState extends State<TantanganScreen> 
    with SingleTickerProviderStateMixin {
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
      title: 'Tantangan Kompos Organik',
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
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: primary40,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  'Tantangan',
                  style: semiBoldBody1.copyWith(
                    color: whiteColor,
                    fontSize: 20,
                  ),
                ),
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        primary40.withOpacity(0.8),
                        primary40,
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                TabBar(
                  controller: _tabController,
                  indicatorColor: primary40,
                  indicatorWeight: 3,
                  labelColor: primary40,
                  unselectedLabelColor: Colors.grey,
                  tabs: const [
                    Tab(text: 'Tantangan'),
                    Tab(text: 'Leaderboard'),
                    Tab(text: 'Voucher'),
                  ],
                ),
              ),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildTantanganList(),
            const LeaderboardScreen(),
            const KuponScreen(),
          ],
        ),
      ),
    );
  }

  Widget _buildTantanganList() {
    return AnimatedList(
      initialItemCount: tantanganList.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index, animation) {
        return SlideTransition(
          position: animation.drive(
            Tween(
              begin: const Offset(1.0, 0.0),
              end: const Offset(0.0, 0.0),
            ).chain(CurveTween(curve: Curves.easeOutQuint)),
          ),
          child: FadeTransition(
            opacity: animation,
            child: _buildTantanganCard(tantanganList[index]),
          ),
        );
      },
    );
  }

  Widget _buildTantanganCard(Tantangan tantangan) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Hero(
        tag: tantangan.title,
        child: Material(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      DetailTantanganScreen(tantangan: tantangan),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
              );
            },
            borderRadius: BorderRadius.circular(16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.withOpacity(0.2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    child: ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                        colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                      ).createShader(bounds),
                      blendMode: BlendMode.darken,
                      child: Image.asset(
                        tantangan.image,
                        width: double.infinity,
                        height: 180,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          height: 180,
                          color: Colors.grey[200],
                          child: const Icon(
                            Icons.image_not_supported,
                            size: 50,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                tantangan.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: primary40.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                '${tantangan.points} POINT',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: primary40,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          tantangan.tanggal,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          tantangan.deskripsi,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[800],
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}