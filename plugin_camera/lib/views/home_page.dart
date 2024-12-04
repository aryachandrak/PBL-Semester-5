import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plugin_camera/provider/navigation_provider.dart';
import 'package:plugin_camera/views/history_page.dart';
import 'package:plugin_camera/views/later_page.dart';
import 'package:plugin_camera/views/tips_page.dart';
import 'package:plugin_camera/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const HomePage({super.key, required this.cameras});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: screenSize.height / 2.5,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromARGB(200, 113, 251, 241),
                              Colors.white
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      height: 45,
                                      width: 45,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            "assets/profile.jpg",
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(
                                          color: Colors.white,
                                          style: BorderStyle.solid,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "Halo Ayra, Selamat Datang!",
                                      style: GoogleFonts.montserrat(
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context
                                        .read<NavigationProvider>()
                                        .navigateToPage(context, 'Notification');
                                  },
                                  child: Icon(
                                    Icons.notifications_active_outlined,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 30),
                            Center(
                              child: Container(
                                height: screenSize.width * 0.5,
                                width: screenSize.width * 0.5,
                                decoration: BoxDecoration(
                                  gradient: RadialGradient(
                                    colors: [
                                      Color.fromARGB(255, 255, 255, 255),
                                      Color.fromARGB(255, 0, 255, 238),
                                    ],
                                    center: Alignment.center,
                                    radius: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      screenSize.width * 0.25),
                                  border: Border.all(
                                    color: Color.fromARGB(100, 138, 253, 244),
                                    style: BorderStyle.solid,
                                    width: 10,
                                  ),
                                ),
                                child: Center(
                                  child: ClipOval(
                                    child: Image.asset(
                                      "assets/logo2.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Center(
                              child: Text(
                                "Acne Detection",
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Fitur(
                                    imagePath: "assets/history.png",
                                    title: "Scan History",
                                    targetPage: ScanHistoryPage(),
                                  ),
                                ),
                                Fitur(
                                  imagePath: "assets/tips.png",
                                  title: "Tips",
                                  targetPage: TipsPage(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Fitur(
                                    imagePath: "assets/history.png",
                                    title: "Later",
                                    targetPage: LaterPage(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20), // Ruang tambahan di bawah konten
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: screenSize.width * 0.1,
              right: screenSize.width * 0.1,
              child: CustomButton(
                text: "Start Acne Detection",
                onPressed: () {
                  context.read<NavigationProvider>().navigateToPage(
                      context, 'Camera',
                      arguments: widget.cameras);
                },
                gradientColors: [
                  Color.fromARGB(255, 152, 241, 235),
                  Color.fromARGB(255, 105, 205, 210),
                ],
                borderRadius: 20.0,
                boxShadow: BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(0, 4),
                  blurRadius: 10,
                  spreadRadius: 0,
                ),
                widthFactor: 0.8,
                heightFactor: 0.1,
                fontSizeFactor: 0.025,
                fontWeight: FontWeight.bold,
                textColor: const Color.fromARGB(255, 5, 54, 72),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Fitur extends StatelessWidget {
  final String imagePath;
  final String title;
  final Widget targetPage;
  final VoidCallback? onTap;

  const Fitur({
    super.key,
    required this.imagePath,
    required this.title,
    this.onTap,
    required this.targetPage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => targetPage,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              var curve = Curves.easeInOut;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var slideAnimation = animation.drive(tween);

              return SlideTransition(
                position: slideAnimation,
                child: child,
              );
            },
          ),
        );
      },
      child: Card(
        elevation: 8,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: 80,
            height: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imagePath,
                  width: 30,
                ),
                SizedBox(height: 10),
                Text(
                  title,
                  style: GoogleFonts.montserrat(fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
