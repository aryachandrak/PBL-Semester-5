import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScanHistoryPage extends StatelessWidget {
  // Contoh data statis untuk hasil scan, jenis jerawat, dan rekomendasi pengobatan
  final List<Map<String, dynamic>> scanHistory = [
    {
      'imagePath': 'assets/scan1.jpg',
      'acneType': 'Jerawat Batu',
      'recommendation': 'Gunakan salep benzoyl peroxide dan hindari makanan berlemak.'
    },
    {
      'imagePath': 'assets/scan2.jpeg',
      'acneType': 'Komedo',
      'recommendation': 'Gunakan cleanser berbahan salicylic acid dan rutin eksfoliasi.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Scan History',
          style: GoogleFonts.montserrat(fontSize: 20),
        ),
        backgroundColor: Color.fromARGB(255, 0, 255, 238),
      ),
      body: ListView.builder(
        itemCount: scanHistory.length,
        itemBuilder: (context, index) {
          final scan = scanHistory[index];
          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Menampilkan gambar hasil scan
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      scan['imagePath'],
                      fit: BoxFit.cover,
                      height: 150,
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(height: 10),
                  
                  // Menampilkan jenis jerawat
                  Text(
                    'Jenis Jerawat: ${scan['acneType']}',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),

                  // Menampilkan rekomendasi pengobatan
                  Text(
                    'Rekomendasi Pengobatan: ${scan['recommendation']}',
                    style: GoogleFonts.montserrat(fontSize: 14),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
