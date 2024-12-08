import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TipsPage extends StatefulWidget {
  const TipsPage({super.key});

  @override
  State<TipsPage> createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  final List<Map<String, String>> articles = [
    {
      "title": "Apa Itu Jerawat?",
      "description": "Jerawat adalah kondisi kulit yang umum terjadi, terutama selama masa pubertas. Ini disebabkan oleh penyumbatan pori-pori oleh minyak dan sel kulit mati."
    },
    {
      "title": "Penyebab Jerawat",
      "description": "Penyebab utama jerawat meliputi produksi minyak berlebih, penyumbatan pori-pori, dan infeksi bakteri. Hormon juga berperan dalam kemunculan jerawat."
    },
    {
      "title": "Cara Mengatasi Jerawat",
      "description": "Gunakan produk perawatan kulit yang mengandung bahan aktif seperti benzoyl peroxide atau asam salisilat untuk membantu mengatasi jerawat."
    },
    {
      "title": "Pencegahan Jerawat",
      "description": "Menjaga kebersihan kulit, menggunakan produk non-comedogenic, dan menghindari makanan tinggi gula dapat membantu mencegah jerawat."
    },
    {
      "title": "Kapan Harus Mengunjungi Dokter?",
      "description": "Jika jerawat Anda parah atau tidak kunjung membaik dengan perawatan rumahan, sebaiknya konsultasikan dengan dokter kulit."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tips Jerawat",
          style: GoogleFonts.montserrat(fontSize: 20),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 255, 238),
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                articles[index]["title"]!,
                style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                articles[index]["description"]!,
                style: GoogleFonts.montserrat(),
              ),
              onTap: () {
              },
            ),
          );
        },
      ),
    );
  }
}
