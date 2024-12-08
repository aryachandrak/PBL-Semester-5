import 'package:flutter/material.dart';
import 'package:plugin_camera/views/welcome/onboarding_two_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'onboarding_three_screen.dart';

class OnboardingOneScreen extends StatefulWidget {
  const OnboardingOneScreen({Key? key}) : super(key: key);

  @override
  OnboardingOneScreenState createState() => OnboardingOneScreenState();
}

class OnboardingOneScreenState extends State<OnboardingOneScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.5, 0),
              end: Alignment(0.5, 1),
              colors: [
                // Color(0xFFB2EBF2), // Warna gradasi atas
                Colors.white,
                Color(0xFF6DA06F), // Warna gradasi bawah
              ],
            ),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        left: 10.0,
                        top: 50.0,
                        right: 10.0,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/3.png',
                            height: 600,
                            width: 360,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              _buildContentSection(context)
            ],
          ),
        ),
      ),
    );
  }

  /// Bagian Konten Bawah
  Widget _buildContentSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 14.0,
        vertical: 30.0,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(64.0),
          topRight: Radius.circular(64.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(left: 4.0),
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Recognize the Cause of Your Acne with Glowbies",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                SizedBox(
                  height: 8.0,
                  child: AnimatedSmoothIndicator(
                    activeIndex: 0,
                    count: 2,
                    effect: ScrollingDotsEffect(
                      spacing: 4.0,
                      activeDotColor: Color(0xFF6DA06F),
                      dotColor: Colors.grey[300]!,
                      dotHeight: 8.0,
                      dotWidth: 8.0,
                    ),
                  ),
                ),
                const SizedBox(height: 40.0), // Mengurangi jarak bawah
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OnboardingThreeScreen(), // Ganti dengan halaman tujuan
                          ),
                        );
                      },
                      child: const Text(
                        "Skip",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Color(0xFF6DA06F),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OnboardingTwoScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF6DA06F),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, 
                          vertical: 14.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                      child: const Text(
                        "Next",
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
