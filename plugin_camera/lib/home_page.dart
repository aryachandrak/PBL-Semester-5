import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plugin_camera/history_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                      Color.fromARGB(200, 113, 251, 241),
                      Colors.white
                    ])),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
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
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                      color: Colors.white,
                                      style: BorderStyle.solid,
                                      width: 2)),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Halo Ayra, Selamat Datang!",
                              style:
                                  GoogleFonts.montserrat(color: Colors.black),
                            )
                          ],
                        ),
                        Container(
                            alignment: Alignment.topRight,
                            child: Icon(
                              Icons.notifications_active_outlined,
                              color: Colors.white,
                              size: 30,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            gradient: RadialGradient(
                              colors: [
                                Color.fromARGB(255, 255, 255, 255),
                                Color.fromARGB(255, 0, 255, 238),
                              ],
                              center: Alignment.center,
                              radius: 1.0, // Sesuaikan radius gradasi
                            ),
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                                color: Color.fromARGB(100, 138, 253, 244),
                                style: BorderStyle.solid,
                                width: 10)),
                        child: Center(
                          child: ClipOval(
                            child: Image.asset(
                              "assets/logo2.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Acne Detection",
                        style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Fitur(
                            imagePath: "assets/history.png",
                            title: "Scan History",
                            onTap: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      ScanHistoryPage(),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    const begin = Offset(
                                        1.0, 0.0); // Mulai dari kanan layar
                                    const end = Offset.zero;
                                    var curve = Curves.easeInOut;

                                    var tween = Tween(begin: begin, end: end)
                                        .chain(CurveTween(curve: curve));
                                    var slideAnimation = animation.drive(tween);

                                    return SlideTransition(
                                      position: slideAnimation,
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            }),
                      ),
                      Fitur(
                        imagePath: "assets/tips.png",
                        title: "Tips",
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Fitur(
                            imagePath: "assets/history.png", title: "Later"),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 160,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30),
                    height: 65,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Color.fromARGB(255, 0, 255, 238),
                          Color.fromARGB(255, 105, 205, 210),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Colors.black.withOpacity(0.2), // Warna bayangan
                          offset: Offset(0, 4),
                          blurRadius: 10,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Start Acne Detection",
                          style: GoogleFonts.montserrat(
                              fontSize: 23,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      )),
    );
  }
}

class Fitur extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback? onTap;

  const Fitur(
      {super.key, required this.imagePath, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: GoogleFonts.montserrat(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
