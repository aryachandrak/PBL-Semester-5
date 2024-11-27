import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TipsPage extends StatefulWidget {
  const TipsPage({super.key});

  @override
  State<TipsPage> createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tips",
          style: GoogleFonts.montserrat(fontSize: 20),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 255, 238),
      ),
      body: const Center(
        child: Text("Tempat tips"),
      ),
    );
  }
}
