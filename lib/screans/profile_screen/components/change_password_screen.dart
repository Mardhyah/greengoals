import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  static const String routePath = '/change-password';

  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Kata Sandi'),
      ),
      body: const Center(
        child: Text('Halaman Ubah Kata Sandi'),
      ),
    );
  }
}
