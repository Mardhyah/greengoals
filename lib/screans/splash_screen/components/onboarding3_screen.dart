import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:greengoals/screans/splash_screen/components/sign_in_screen.dart';

class Onboarding3Screen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated Image
              Animate(
                effects: const [
                  FadeEffect(
                    duration: Duration(milliseconds: 800),
                    curve: Curves.easeOut,
                  ),
                  SlideEffect(
                    begin: Offset(0, -30),
                    end: Offset(0, 0),
                    duration: Duration(milliseconds: 800),
                    curve: Curves.easeOut,
                  )
                ],
                child: Image.asset(
                  'assets/Image/onboard3.png',
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.35,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 40),

              // Animated Main Text
              Animate(
                effects: const [
                  FadeEffect(
                    duration: Duration(milliseconds: 800),
                    delay: Duration(milliseconds: 300),
                  ),
                  SlideEffect(
                    begin: Offset(0, 20),
                    end: Offset(0, 0),
                    duration: Duration(milliseconds: 800),
                    delay: Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  )
                ],
                child: const Text(
                  'Siap untuk Mulai?',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2E7D32),
                    letterSpacing: 0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16),

              // Animated Description
              Animate(
                effects: const [
                  FadeEffect(
                    duration: Duration(milliseconds: 800),
                    delay: Duration(milliseconds: 500),
                  ),
                  SlideEffect(
                    begin: Offset(0, 20),
                    end: Offset(0, 0),
                    duration: Duration(milliseconds: 800),
                    delay: Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                  )
                ],
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                    'Daftar sekarang untuk menikmati semua fitur kami dan mulai perjalananmu bersama kami!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 60),

              // Animated Sign Up Button with Special Effect
              Animate(
                effects: const [
                  FadeEffect(
                    duration: Duration(milliseconds: 800),
                    delay: Duration(milliseconds: 700),
                  ),
                  ScaleEffect(
                    begin: Offset(0.95, 0.95),
                    end: Offset(1, 1),
                    duration: Duration(milliseconds: 800),
                    delay: Duration(milliseconds: 700),
                    curve: Curves.easeOut,
                  ),
                  ShimmerEffect(
                    duration: Duration(milliseconds: 1500),
                    delay: Duration(milliseconds: 1200),
                    color: Colors.white24,
                  )
                ],
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) =>
                              const SignInScreen(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(0.0, 1.0),
                                  end: Offset.zero,
                                ).animate(animation),
                                child: child,
                              ),
                            );
                          },
                          transitionDuration: const Duration(milliseconds: 500),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2E7D32),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 3,
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}