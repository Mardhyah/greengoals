import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:greengoals/screans/splash_screen/components/onboarding3_screen.dart';

class Onboarding2Screen extends StatelessWidget {
  const Onboarding2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                // Gambar dengan Animasi
                Animate(
                  effects: const [
                    FadeEffect(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.easeOut,
                    ),
                    SlideEffect(
                      begin: Offset(30, 0),
                      end: Offset(0, 0),
                      duration: Duration(milliseconds: 800),
                      curve: Curves.easeOut,
                    )
                  ],
                  child: Image.asset(
                    'assets/Image/onboard2.png',
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.35,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 40),

                // Judul dengan Animasi
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
                    'Mulai Perjalananmu',
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

                // Deskripsi dengan Animasi
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
                      'Jelajahi berbagai fitur menarik yang telah kami sediakan untuk kamu!',
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

                // Tombol Next dengan Animasi
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
                                Onboarding3Screen(), // Menghapus const di sini
                            transitionsBuilder:
                                (context, animation, secondaryAnimation, child) {
                              final tween = Tween(
                                begin: const Offset(1.0, 0.0),
                                end: Offset.zero,
                              );
                              final fadeAnimation = CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeOut,
                              );
                              return SlideTransition(
                                position: tween.animate(fadeAnimation),
                                child: FadeTransition(
                                  opacity: fadeAnimation,
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
                        elevation: 2,
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}