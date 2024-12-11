import 'package:flutter/material.dart';
import 'package:plugin_camera/views/auth/sign_up_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../auth/login_page.dart';

class OnboardingThreeScreen extends StatefulWidget {
  const OnboardingThreeScreen({Key? key}) : super(key: key);

  @override
  OnboardingThreeScreenState createState() => OnboardingThreeScreenState();
}

class OnboardingThreeScreenState extends State<OnboardingThreeScreen> {
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
                Colors.white, // Warna gradasi atas
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
                        left: 8.0,
                        top: 50.0,
                        right: 8.0,
                        bottom: 5.0,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Image.asset(
                              'assets/images/3.png',
                              height: MediaQuery.of(context).size.height * 0.6,
                              width: MediaQuery.of(context).size.width * 0.8,
                            ),
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
                    "Connect with our app to detect acne and receive personalized skincare solutions",
                    maxLines: 3,
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
                const SizedBox(
                  height: 8.0,
                  child: AnimatedSmoothIndicator(
                    activeIndex: 2,
                    count: 3,
                    effect: ScrollingDotsEffect(
                      spacing: 4.0,
                      activeDotColor: Color(0xFF6DA06F),
                      dotColor: Colors.grey,
                      dotHeight: 8.0,
                      dotWidth: 8.0,
                    ),
                  ),
                ),
                const SizedBox(height: 40.0), // Mengurangi jarak bawah
                Column(
                  children: [
                    SizedBox(
                      width:
                          double.infinity, // Ensures the button width is same
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF6DA06F), // Button color
                          padding: const EdgeInsets.symmetric(
                              vertical: 14.0, horizontal: 30.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      width:
                          double.infinity, // Ensures the button width is same
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpPage(),
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF6DA06F)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 14.0, horizontal: 30.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF6DA06F),
                          ),
                        ),
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
