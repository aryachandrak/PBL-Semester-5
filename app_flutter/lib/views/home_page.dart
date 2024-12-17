import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plugin_camera/provider/profile_image_provider.dart';
import 'package:plugin_camera/views/create_routine.dart';
import 'package:plugin_camera/views/history_page.dart';
import 'package:plugin_camera/views/wawasan.dart';
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
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    final profileImagePath =
        Provider.of<ProfileImageProvider>(context).profileImagePath;
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
                      Container(
                        height: screenSize.height / 3.5,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              primary,
                              white,
                            ],
                          ),
                        ),
                      ),
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
                                          image: DecorationImage(
                                            image: profileImagePath != null
                                                ? FileImage(
                                                    File(profileImagePath))
                                                : const AssetImage(
                                                        'assets/default-profile.jpg')
                                                    as ImageProvider,
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
                                        "Hello ${user?.displayName ?? 'Pengguna'}, Welcome Back!",
                                        style: GoogleFonts.montserrat(
                                            color: white,
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
                                    child: Icon(
                                      Icons.notifications_active_outlined,
                                      color: white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Center(
                              child: Container(
                                height: screenSize.width * 0.6,
                                width: double.infinity,
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
                                            "Healthy Skin, Confidence Back!\nBecause Your Beauty is so Precious",
                                            style: medium14.copyWith(
                                                color: Colors.grey[700]),
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
                                            textColor: white,
                                            gradientColors: [
                                              primary,
                                              primary,
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 0, top: 10),
                                        child: SizedBox(
                                          height:
                                              200, // Set a fixed height or adjust as needed
                                          child: Image.asset(
                                            "assets/images/woman.png",
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
                            const SizedBox(height: 12),
                            const Wawasan(),
                            const SizedBox(height: 12),
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    white,
                                    const Color(0XFFFDEBEA),
                                    // Color.fromARGB(255, 253, 235, 234),
                                    const Color.fromARGB(255, 226, 233, 214),
                                    const Color.fromARGB(255, 220, 218, 246),
                                  ],
                                ),
                              ),
                              // color: green,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      'Your daily skin care checklist ❗',
                                      style: medium16,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Fitur(
                                          imagePath:
                                              "assets/images/routine.jpg",
                                          title: "Create Routine",
                                          targetPage: CreateRoutine(),
                                        ),
                                        const Fitur(
                                          imagePath: "assets/images/recent.jpg",
                                          title: "Recent Scan",
                                          targetPage: ScanHistoryPage(),
                                        ),
                                        const Fitur(
                                          imagePath:
                                              "assets/images/know_skin.jpg",
                                          title: "Analyze Your Skin",
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
