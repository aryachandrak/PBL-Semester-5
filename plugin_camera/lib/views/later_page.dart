import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LaterPage extends StatefulWidget {
  const LaterPage({super.key});

  @override
  State<LaterPage> createState() => _LaterPageState();
}

class _LaterPageState extends State<LaterPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Later Fitur",
            style: GoogleFonts.montserrat(fontSize: 20),
          ),
          backgroundColor: const Color.fromARGB(255, 0, 255, 238),
        ),
        body: const Center(
          child: Text("Untuk fitur selanjutnya"),
        ),
      ),
    );
  }
}
