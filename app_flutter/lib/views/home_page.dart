import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plugin_camera/widgets/theme.dart';
import 'package:plugin_camera/provider/camera_provider.dart';
import 'package:plugin_camera/provider/navigation_provider.dart';
import 'package:plugin_camera/views/tips_page.dart';
import 'package:plugin_camera/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final cameras = Provider.of<CameraProvider>(context, listen: false).cameras;
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
                      // Container(
                      //   height: screenSize.height / 2.5,
                      //   width: double.infinity,
                      //   decoration: const BoxDecoration(
                      //     gradient: LinearGradient(
                      //       begin: Alignment.topCenter,
                      //       end: Alignment.bottomCenter,
                      //       colors: [
                      //         Color.fromARGB(200, 113, 251, 241),
                      //         Colors.white
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.topLeft,
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          image: const DecorationImage(
                                            image: AssetImage(
                                              "assets/profile.jpg",
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          border: Border.all(
                                            color: Colors.white,
                                            style: BorderStyle.solid,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        "Hello ${FirebaseAuth.instance.currentUser?.displayName ?? 'Pengguna'}, Welcome Back!",
                                        style: GoogleFonts.montserrat(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      context
                                          .read<NavigationProvider>()
                                          .navigateToPage(
                                              context, 'Notification');
                                    },
                                    child: const Icon(
                                      Icons.notifications_active_outlined,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(left: 18.0),
                            //   child: Image.asset(
                            //     "assets/logoTxt.png",
                            //     height: 70,
                            //     width: 70,
                            //   ),
                            // ),
                            Center(
                              child: Container(
                                height: screenSize.width * 0.5,
                                // width: screenSize.width * 0.1,
                                // margin: const EdgeInsets.only(left: 5.0),
                                color: grey,
                                child: Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 16, top: 10),
                                          child: Image.asset(
                                            "assets/logoTxt.png",
                                            height: 120,
                                            width: 120,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 12),
                                          child: Text(
                                            "Your Beauty is so Precious",
                                            style: GoogleFonts.workSans(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xFF423838),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12, top: 10),
                                          child: CustomButton(
                                            text: "Learn More About Us",
                                            onPressed: () {
                                              context
                                                  .read<NavigationProvider>()
                                                  .navigateToPage(
                                                      context, 'AboutUs');
                                            },
                                            widthFactor: 0.4,
                                            heightFactor: 0.04,
                                            fontSizeFactor: 0.015,
                                            borderRadius: 12.0,
                                            textColor: Color(0xFF6DA06F),
                                            gradientColors: const [
                                              Color.fromARGB(
                                                  255, 255, 255, 255),
                                              Color.fromARGB(
                                                  255, 255, 255, 255),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 5, top: 10),
                                        child: SizedBox(
                                          height:
                                              200, // Set a fixed height or adjust as needed
                                          child: Image.asset(
                                            "assets/woman.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Center(
                            //   child: Text(
                            //     "Acne Detection",
                            //     style: GoogleFonts.montserrat(
                            //       color: Colors.black,
                            //       fontSize: 30,
                            //       fontWeight: FontWeight.bold,
                            //     ),
                            //   ),
                            // ),
                            const SizedBox(height: 10),
                            Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromARGB(255, 255, 255, 255),
                                    Color.fromARGB(255, 193, 250, 255),
                                  ],
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      'Checklist Perawatan Kulit Harian Anda ',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  const Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Fitur(
                                          imagePath: "assets/images/1.png",
                                          title: "Rutinitas",
                                          targetPage: TipsPage(),
                                        ),
                                        Fitur(
                                          imagePath: "assets/images/2.png",
                                          title: "Tips",
                                          targetPage: TipsPage(),
                                        ),
                                        Fitur(
                                          imagePath: "assets/images/3.png",
                                          title: "Konsultasi",
                                          targetPage: TipsPage(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Color.fromARGB(255, 253, 235, 234),
                                    Color.fromARGB(255, 226, 233, 214),
                                    Color.fromARGB(255, 220, 218, 246),
                                  ],
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      'Checklist Perawatan Kulit Harian Anda',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Fitur(
                                          imagePath: "assets/scan1.jpg",
                                          title: "Rutinitas",
                                          targetPage: TipsPage(),
                                        ),
                                        Fitur(
                                          imagePath: "assets/images/2.png",
                                          title: "Tips",
                                          targetPage: TipsPage(),
                                        ),
                                        Fitur(
                                          imagePath: "assets/images/3.png",
                                          title: "Konsultasi",
                                          targetPage: TipsPage(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Fitur(
                                          imagePath: "assets/images/1.png",
                                          title: "Rutinitas",
                                          targetPage: TipsPage(),
                                        ),
                                        Fitur(
                                          imagePath: "assets/images/2.png",
                                          title: "Tips",
                                          targetPage: TipsPage(),
                                        ),
                                        Fitur(
                                          imagePath: "assets/images/3.png",
                                          title: "Konsultasi",
                                          targetPage: TipsPage(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Fitur(
                                          imagePath: "assets/images/1.png",
                                          title: "Konsultasi",
                                          targetPage: TipsPage(),
                                        ),
                                        Fitur(
                                          imagePath: "assets/images/3.png",
                                          title: "Konsultasi",
                                          targetPage: TipsPage(),
                                        ),
                                        Fitur(
                                          imagePath: "assets/images/2.png",
                                          title: "Konsultasi",
                                          targetPage: TipsPage(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 40),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 5,
              left: 320,
              right: 0,
              child: Column(
                children: [
                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(0, 4),
                          blurRadius: 10,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.camera_alt,
                        size: 25,
                        color: Color.fromARGB(255, 5, 54, 72),
                      ),
                      onPressed: () {
                        context.read<NavigationProvider>().navigateToPage(
                              context,
                              'Camera',
                              arguments: cameras,
                            );
                      },
                    ),
                  ),
                ],
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
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: SizedBox(
          width: 120,
          height: 130,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    imagePath,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    title,
                    style: GoogleFonts.montserrat(
                        fontSize: 14, fontWeight: FontWeight.w500),
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
//       child: Card(
//         elevation: 8,
//         color: Colors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: SizedBox(
//             width: 90,
//             height: 100,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   imagePath,
//                   width: 30,
//                 ),
//                 const SizedBox(height: 10),
//                 Text(
//                   title,
//                   style: GoogleFonts.montserrat(fontSize: 12),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
