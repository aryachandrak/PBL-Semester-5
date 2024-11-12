import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plugin_camera/views/welcome/welcome_screen3.dart';

class WelcomeScreen2 extends StatelessWidget {
  const WelcomeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    // final skinHealth = Provider.of<WelcomeProvider>(context).skinHealth;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(10),
        child: Container(
          color: const Color(0xFF0F4C81),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipPath(
              clipper: CurvedClipper2(),
              child: Container(
                height:
                    MediaQuery.of(context).size.height / 1.7, // Cover top half
                color: const Color(0xFFFFDBBB), // Background color

                child: Stack(
                  alignment:
                      Alignment.center, // Align text and image in the center
                  children: [
                    Positioned(
                      top: 35, // Position the text at the bottom of the image
                      child: Text(
                        "Morning Routine", // Add your desired text
                        style: GoogleFonts.gloriaHallelujah(
                          fontSize: 35,
                          fontWeight: FontWeight.normal ,
                          color: const Color(0xFFa82810), // Text color
                        ),
                      ),
                    ),
                    // Image Widget
                    Positioned(
                      top: 76, // Adjust the position of the image
                      child: Image.asset(
                        'assets/images/skincare.png', // Your image path here
                        width: MediaQuery.of(context).size.width * 0.8,
                        // height: 150, // Adjust image height as needed
                        // width: 200, // Adjust image width as needed
                      ),
                    ),
                    // Text Widget
                    Positioned(
                      bottom: 50, // Position the text at the bottom of the image
                      child: Text(
                        "Night Routine", // Add your desired text
                        style: GoogleFonts.gloriaHallelujah(
                          fontSize: 35,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xFFa82810), // Text color
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // The text below the curved container
            Padding(
              padding: const EdgeInsets.all(45.0),
              child: Text(
                "Mencatat Produk Perawatan Jerawat Anda",
                textAlign: TextAlign.center,
                style: GoogleFonts.lexend(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFF0F4C81)),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildProgressSegment(),
                const SizedBox(width: 10),
                _buildProgressSegment(isActive: true),
                const SizedBox(width: 10),
                _buildProgressSegment(),
                const SizedBox(width: 10),
                _buildProgressSegment(),
              ],
            ),

            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WelcomeScreen3()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFE5B4),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 10),
                    ),
                    child: Text(
                      'Selanjutnya  >',
                      style: GoogleFonts.lexend(
                          fontSize: 15, color: const Color(0xFFF89880)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

Widget _buildProgressSegment({bool isActive = false}) {
  return Container(
    width: 5,
    height: 5,
    decoration: BoxDecoration(
      color: isActive
          ? const Color.fromARGB(255, 221, 112, 112)
          : Colors.grey.withOpacity(0.4),
      borderRadius: BorderRadius.circular(5),
    ),
  );
}

class CurvedClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height + 50, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

