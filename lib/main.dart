import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greengoals/screans/profile_screen/components/add_address_screen.dart';
import 'models/user_profile.dart';

// Import screens

import 'screans/tantangan_screen/tantangan_screen.dart';
import 'screans/pesanan_screen/pesanan_screen.dart';
import 'screans/home_screen/home_screen.dart';
import 'screans/profile_screen/profile_screen.dart';
import 'themes/color_scheme.dart';
import 'screans/profile_screen/components/edit_profile_screen.dart';
import 'screans/profile_screen/components/address_screen.dart';
import 'screans/profile_screen/components/voucher_screen.dart';
import 'screans/profile_screen/components/change_password_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/splash-screen',
      routes: {
       
        '/': (context) => const MainPage(),
        EditProfileScreen.routePath: (context) {
          final args = ModalRoute.of(context)?.settings.arguments as UserProfile?;
          return EditProfileScreen(
            initialName: args?.name ?? '',
            initialEmail: args?.email ?? '',
            initialPhone: args?.phone ?? '',
            initialProfileImage: args?.profileImage ?? '',
          );
        },
        AddressScreen.routePath: (context) => const AddressScreen(),
        AddAddressScreen.routePath: (context) => const AddAddressScreen(),
        VoucherScreen.routePath: (context) => const VoucherScreen(),
        EditPasswordScreen.routePath: (context) => const EditPasswordScreen(),
      },
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
    const HomeScreen(),
    const TantanganScreen(),
    const PesananScreen(),
    const ProfileScreen(),
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
            'assets/image/HomeIcon.svg',
            'Beranda',
            _selectedIndex == 0,
          ),
          _buildBottomNavigationBarItem(
            'assets/image/ChallengeIcon.svg',
            'Tantangan',
            _selectedIndex == 1,
          ),
          _buildBottomNavigationBarItem(
            'assets/image/OrderIcon.svg',
            'Pesanan',
            _selectedIndex == 2,
          ),
          _buildBottomNavigationBarItem(
            'assets/image/ProfileIcon.svg',
            'Profil',
            _selectedIndex == 3,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
    String iconPath,
    String label,
    bool isSelected,
  ) {
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