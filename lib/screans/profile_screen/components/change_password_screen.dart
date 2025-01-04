import 'package:flutter/material.dart';
import 'package:greengoals/themes/color_scheme.dart';
import 'package:greengoals/themes/text_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditPasswordScreen extends StatefulWidget {
  static const String routePath = '/edit-password';
  const EditPasswordScreen({Key? key}) : super(key: key);

  @override
  State<EditPasswordScreen> createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? _storedPassword;

  @override
  void initState() {
    super.initState();
    _loadStoredPassword();
  }

  Future<void> _loadStoredPassword() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _storedPassword = prefs.getString('password') ?? 'password123'; // Default password
    });
  }

  Future<void> _updatePassword(String newPassword) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('password', newPassword);
  }

  void _saveNewPassword() {
    final currentPassword = _currentPasswordController.text.trim();
    final newPassword = _newPasswordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (currentPassword.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty) {
      _showSnackBar('Semua field harus diisi');
      return;
    }

    if (currentPassword != _storedPassword) {
      _showSnackBar('Password saat ini salah');
      return;
    }

    if (newPassword != confirmPassword) {
      _showSnackBar('Password baru tidak cocok');
      return;
    }

    _updatePassword(newPassword).then((_) {
      _showSnackBar('Password berhasil diperbarui');
      Navigator.pop(context);
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary40,
        title: Text(
          'Change Password',
          style: semiBoldBody1.copyWith(color: whiteColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      _buildPasswordField(
                        controller: _currentPasswordController,
                        labelText: 'Password Lama',
                        icon: Icons.lock,
                      ),
                      const SizedBox(height: 20),
                      _buildPasswordField(
                        controller: _newPasswordController,
                        labelText: 'Password Baru',
                        icon: Icons.lock_reset,
                      ),
                      const SizedBox(height: 20),
                      _buildPasswordField(
                        controller: _confirmPasswordController,
                        labelText: 'Konfirmasi Password Baru',
                        icon: Icons.lock_reset,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _saveNewPassword,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary40,
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Simpan Password',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: whiteColor),
  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      obscureText: true,
    );
  }
}
