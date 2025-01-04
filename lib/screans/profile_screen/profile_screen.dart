import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greengoals/screans/profile_screen/components/change_password_screen.dart';
import 'package:greengoals/themes/color_scheme.dart';
import 'package:greengoals/themes/text_theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'components/edit_profile_screen.dart';
import 'components/address_screen.dart';
import 'components/voucher_screen.dart';
import '../../models/user_profile.dart';

class ProfileScreen extends StatefulWidget {
  static const String routePath = '/profile-screen';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = 'belum di isi';
  String email = '';
  String phone = '';
  String profileImage = 'assets/image/profile.jpg';

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('user_name') ?? 'belum di isi';
      email = prefs.getString('user_email') ?? '';
      phone = prefs.getString('user_phone') ?? '';
      profileImage = prefs.getString('user_profile_image') ?? 'assets/image/profile.jpg';
    });
  }

  Future<void> _saveUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name', name);
    await prefs.setString('user_email', email);
    await prefs.setString('user_phone', phone);
    await prefs.setString('user_profile_image', profileImage);
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        profileImage = pickedFile.path;
      });
      await _saveUserProfile();
    }
  }

  ImageProvider _getProfileImage() {
    if (profileImage.startsWith('assets/')) {
      return AssetImage(profileImage);
    } else {
      return FileImage(File(profileImage));
    }
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
      await _saveUserProfile();
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
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Menghapus semua data yang tersimpan
    Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false); // Redirect ke halaman awal
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary40,
        title: Text(
          'Profile',
          style: semiBoldBody1.copyWith(color: whiteColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profil Box
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: _pickImage,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: _getProfileImage(),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            email,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            phone,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
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
              const SizedBox(height: 16),
              // Menu Box
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
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
                      onTap: () => Navigator.of(context).pushNamed(EditPasswordScreen.routePath),
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            SvgPicture.asset(iconPath),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
