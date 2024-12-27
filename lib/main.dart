import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'screans/home_screen.dart';
import 'screans/pesanan_screen.dart';
import 'screans/profil_screen.dart';
import 'screans/tantangan_screen.dart';
import 'themes/color_scheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    TantanganScreen(),
    PesananScreen(),
    ProfilScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        backgroundColor: secondary00,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: [
          _buildBottomNavigationBarItem(
            'assets/img/HomeIcon.svg',
            'Beranda',
            _selectedIndex == 0,
          ),
          _buildBottomNavigationBarItem(
            'assets/img/ChallengeIcon.svg',
            'Tantangan',
            _selectedIndex == 1,
          ),
          _buildBottomNavigationBarItem(
            'assets/img/OrderIcon.svg',
            'Pesanan',
            _selectedIndex == 2,
          ),
          _buildBottomNavigationBarItem(
            'assets/img/ProfileIcon.svg',
            'Profil',
            _selectedIndex == 3,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      String iconPath, String label, bool isSelected) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        iconPath,
        colorFilter: ColorFilter.mode(
          isSelected ? Colors.green : Colors.grey,
          BlendMode.srcIn,
        ),
        width: 20,
        height: 20,
      ),
      label: label,
    );
  }
}
