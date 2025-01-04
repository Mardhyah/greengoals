import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'components/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';
  static const String routePath = 'splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 800),
          pageBuilder: (context, animation, secondaryAnimation) => 
            const OnboardingScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2E7D32),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF2E7D32),
              const Color(0xFF1B5E20),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Animate(
                  effects: const [
                    ScaleEffect(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.easeOutBack,
                      begin: Offset(0.5, 0.5),
                      end: Offset(1.0, 1.0),
                    ),
                    FadeEffect(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.easeIn,
                    ),
                  ],
                  child: Hero(
                    tag: 'appLogo',
                    child: Image.asset(
                      'assets/Image/logo.png',
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.width * 0.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Animate(
                effects: const [
                  SlideEffect(
                    begin: Offset(0, 20),
                    end: Offset(0, 0),
                    duration: Duration(milliseconds: 800),
                    delay: Duration(milliseconds: 400),
                  ),
                  FadeEffect(
                    duration: Duration(milliseconds: 800),
                    delay: Duration(milliseconds: 400),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}