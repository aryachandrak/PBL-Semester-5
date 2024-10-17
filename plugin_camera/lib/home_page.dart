import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.white,
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
                                    // image: DecorationImage(image: ),
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                        color: Colors.white,
                                        style: BorderStyle.solid,
                                        width: 21)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Halo Sinta, Selamat Datang!",
                                style:
                                    GoogleFonts.montserrat(color: Colors.black),
                              )
                            ],
                          ),
                          Container(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.notifications_active,
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
                              color: Colors.black, fontSize: 30),
                        )
                      ],
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
