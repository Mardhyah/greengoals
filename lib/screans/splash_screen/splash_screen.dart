import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'components/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  static var routePath;

  static var routeName;

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E7D32),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Animate(
                effects: const [FadeEffect(duration: Duration(seconds: 2))],
                child: Image.asset(
                  'assets/Image/logo.png',
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.width * 0.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
