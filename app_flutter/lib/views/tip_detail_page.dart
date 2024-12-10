import 'package:flutter/material.dart';
import 'package:plugin_camera/widgets/theme.dart';

class TipDetailPage extends StatelessWidget {
  final String title;
  final List<String> description;
  final String image; // Menambahkan parameter image

  const TipDetailPage({Key? key, required this.title, required this.description, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: gray,
        // title: Text(
        //   title,
        //   style: const TextStyle(
        //     fontSize: 20,
        //     fontWeight: FontWeight.bold,
        //     color: Colors.black,
        //   ),
        // ),
        // foregroundColor: Colors.black,
        // centerTitle: true,
        // elevation: 0, // Menghilangkan bayangan AppBar
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Menampilkan judul tips
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              // Menampilkan gambar dari JSON
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
              ),
              const SizedBox(height: 16),

              // Menampilkan deskripsi tips
              Text(
                'Description',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),

              // Menampilkan list deskripsi
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: description.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 20,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            description[index],
                            style: const TextStyle(
                              fontSize: 16,
                              height: 1.5, // Memberi spasi antar baris
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
