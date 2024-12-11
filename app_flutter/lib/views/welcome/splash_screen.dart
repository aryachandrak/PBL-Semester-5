import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plugin_camera/widgets/theme.dart';
import 'onboarding_one_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Tambahkan logika navigasi ke layar berikutnya setelah delay jika diperlukan
    Future.delayed(const Duration(seconds: 30), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnboardingOneScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 202, 243, 215),
        // backgroundColor: Color(0xFF00AA13),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLogoSection(),
              const SizedBox(height: 15),
              Text(
                "Glowbies",
                style: GoogleFonts.caladea(
                  fontSize: 35, 
                  fontWeight: FontWeight.bold, 
                  color: const Color.fromARGB(255, 30, 141, 112),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  /// Bagian tampilan logo
  Widget _buildLogoSection() {
    return Column(
      children: [
        Image.asset(
          'assets/logoCoba.png',
          height: 130,
          width: 130,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

