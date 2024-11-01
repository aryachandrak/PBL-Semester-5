import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';


class LaterPage extends StatelessWidget {
  final List<Map<String, String>> images = [
    {'path': 'assets/scan1.jpg', 'description': 'Deskripsi gambar 1'},
    {'path': 'assets/scan2.jpeg', 'description': 'Deskripsi gambar 2'},
    // Tambahkan lebih banyak gambar dan deskripsi sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Fitur Proses",
            style: GoogleFonts.montserrat(fontSize: 20),
          ),
          backgroundColor: Color.fromARGB(255, 0, 255, 238),
        ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.7,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _showImageDescription(context, images[index]['description']!);
              },
              child: CachedNetworkImage(
                imageUrl: images[index]['path']!,
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    ),
  );
}

  void _showImageDescription(BuildContext context, String description) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Deskripsi Gambar'),
          content: Text(description),
          actions: <Widget>[
            TextButton(
              child: Text('Tutup'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
