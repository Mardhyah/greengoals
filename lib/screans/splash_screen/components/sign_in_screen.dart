import 'package:flutter/material.dart';
import 'package:greengoals/main.dart'; // Mengimpor MainPage
import 'sign_up_screen.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Simulasi data login sederhana (misalnya, email dan password yang benar)
  final String _correctEmail = 'user@example.com';
  final String _correctPassword = 'password123';

  void _signIn() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    // Validasi input email dan password
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email dan password tidak boleh kosong')),
      );
      return;
    }

    // Cek apakah email dan password cocok
    if (email == _correctEmail && password == _correctPassword) {
      // Arahkan ke halaman MainPage setelah login berhasil
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainPage()), // Ganti dengan MainPage
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Aplikasi
            Image.asset(
              'assets/image/logo.png', // Ganti dengan path logo yang sesuai
              height: 100, // Sesuaikan ukuran logo
            ),
            const SizedBox(height: 40), // Jarak antara logo dan form

            // Input email
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),

            // Input password
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 30),

            // Tombol Sign In
            ElevatedButton(
              onPressed: _signIn, // Panggil fungsi _signIn
              child: const Text('Sign In'),
            ),
            const SizedBox(height: 20),

            // Tombol untuk beralih ke halaman Sign Up
            TextButton(
              onPressed: () {
                // Arahkan ke halaman sign up jika belum punya akun
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpScreen()), // Arahkan ke halaman SignUpScreen
                );
              },
              child: const Text('Don’t have an account? Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
