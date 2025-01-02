import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';
import 'components/edit_profile_screen.dart';
import 'components/address_screen.dart';
import 'components/voucher_screen.dart';
import 'components/change_password_screen.dart';
import '../../models/user_profile.dart';

class ProfileScreen extends StatefulWidget {
  static const String routePath = '/profile-screen';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = 'Bagus Aryandi';
  String email = 'bagusaryandi@gmail.com';
  String phone = '081223567789';
  String profileImage = 'assets/image/profile.jpg';

  ImageProvider _getProfileImage() {
    if (profileImage.startsWith('/')) {
      final file = File(profileImage);
      if (file.existsSync()) {
        return FileImage(file);
      }
    }
    
    return AssetImage(profileImage);
  }
Future<void> _navigateToAddress() async {
  await Navigator.of(context).pushNamed(AddressScreen.routePath);
}

  Future<void> _navigateToEditProfile() async {
    final result = await Navigator.of(context).pushNamed(
      EditProfileScreen.routePath,
      arguments: UserProfile(
        name: name,
        email: email,
        phone: phone,
        profileImage: profileImage,
      ),
    );

    if (result != null && result is UserProfile) {
      setState(() {
        name = result.name;
        email = result.email;
        phone = result.phone;
        profileImage = result.profileImage;
      });
    }
  }

  Future<void> _handleLogout() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi Keluar'),
        content: const Text('Apakah Anda yakin ingin keluar?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Ya'),
          ),
        ],
      ),
    );

    if (confirmed ?? false) {
      // Implement logout logic here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Profil'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 43,
                    backgroundImage: _getProfileImage(),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          email,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          phone,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: _navigateToEditProfile,
                    child: SvgPicture.asset('assets/image/editProfileButton.svg'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  _buildMenuItem(
                    context,
                    iconPath: 'assets/image/profilePersonEdit.svg',
                    title: 'Edit Profil',
                    onTap: _navigateToEditProfile,
                  ),
                  _buildMenuItem(
                    context,
                    iconPath: 'assets/image/profilePersonEdit.svg',
                    title: 'Alamat',
                    onTap: _navigateToAddress,
                  ),
                  _buildMenuItem(
                    context,
                    iconPath: 'assets/image/profileTicketIcon.svg',
                    title: 'Voucher',
                    onTap: () => Navigator.of(context).pushNamed(VoucherScreen.routePath),
                  ),
                  _buildMenuItem(
                    context,
                    iconPath: 'assets/image/profileSandiIcon.svg',
                    title: 'Ubah Kata Sandi',
                    onTap: () => Navigator.of(context).pushNamed(ChangePasswordScreen.routePath),
                  ),
                  _buildMenuItem(
                    context,
                    iconPath: 'assets/image/profileLogoutIcon.svg',
                    title: 'Keluar',
                    onTap: _handleLogout,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required String iconPath,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(iconPath),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
          const Divider(thickness: 1, height: 25),
        ],
      ),
    );
  }
}

