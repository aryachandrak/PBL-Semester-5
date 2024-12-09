import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/tips_page_provider.dart';
import '../widgets/tips_tile_widget.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';
import 'detail_tips.dart';

class TipsPage extends StatelessWidget {
  const TipsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    TipsPageProvider tipsPageProvider = Provider.of<TipsPageProvider>(context);

    // Widget untuk menampilkan daftar tips
    Widget listTips() {
      return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          elevation: 0,
          backgroundColor: const Color(0xFF6DA06F),
          automaticallyImplyLeading: false,
          toolbarHeight: 55,
          centerTitle: true,
          flexibleSpace: Container(
            padding: const EdgeInsets.only(top: 10),
            width: double.infinity,
            child: Stack(
              children: [
                const Center(
                  child: Text(
                    'Tips',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Lato',
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 30,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(
                          context); // Navigasi kembali ke halaman sebelumnya
                    },
                    child: const Icon(
                      Icons.arrow_back_sharp,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: VsScrollbar(
          controller: _scrollController,
          showTrackOnHover: true,
          isAlwaysShown: true,
          style: const VsScrollbarStyle(
            color: Color(0xff9D9F9F),
            hoverThickness: 100.0,
            radius: Radius.circular(5),
            thickness: 7,
          ),
          child: SingleChildScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 20),
                TipsTileWidget(
                  id: 0,
                  image: 'assets/images/blacheads.jpg',
                  title:
                      'Jerawat Blackhead: Mengatasi Sumbatan Pori-pori dengan Tepat',
                  subTitle:
                      'Cara terbaik untuk menghilangkan komedo dan mencegah penumpukan minyak di pori-pori.',
                  onTap: () {
                    tipsPageProvider.setCurrentIndex(0); // Corrected this line
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetailTips()),
                    );
                  },
                ),
                TipsTileWidget(
                  id: 1,
                  image: 'assets/images/whiteheads.jpg',
                  title:
                      'Jerawat Whitehead: Mengurangi Peradangan dan Mencegah Pembentukan Jerawat Baru',
                  subTitle:
                      'Tips merawat kulit agar whitehead tidak berkembang menjadi jerawat yang lebih besar.',
                  onTap: () {
                    tipsPageProvider.setCurrentIndex(1); // Corrected this line
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetailTips()),
                    );
                  },
                ),
                TipsTileWidget(
                  id: 2,
                  image: 'assets/images/papula.jpg',
                  title:
                      'Jerawat Papula: Menangani Peradangan Tanpa Meninggalkan Bekas',
                  subTitle:
                      'Langkah-langkah untuk meredakan jerawat papul agar tidak meninggalkan noda atau bekas.',
                  onTap: () {
                    tipsPageProvider.setCurrentIndex(2); // Corrected this line
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetailTips()),
                    );
                  },
                ),
                TipsTileWidget(
                  id: 3,
                  image: 'assets/images/pustula.jpg',
                  title:
                      'Jerawat Pustula: Menyembuhkan Jerawat Bernanah dengan Aman',
                  subTitle:
                      'Cara merawat pustul untuk menghindari infeksi dan mencegah penyebaran ke area lain.',
                  onTap: () {
                    tipsPageProvider.setCurrentIndex(3); // Corrected this line
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetailTips()),
                    );
                  },
                ),
                TipsTileWidget(
                  id: 4,
                  image: 'assets/images/kistik.jpg',
                  title:
                      'Jerawat Kistik: Menangani Jerawat yang Dalam dan Menyakitkan',
                  subTitle:
                      'Strategi untuk meredakan jerawat kistik yang membutuhkan perhatian medis dan perawatan khusus.',
                  onTap: () {
                    tipsPageProvider.setCurrentIndex(4); // Corrected this line
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetailTips()),
                    );
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      );
    }

    switch (tipsPageProvider.currentIndex) {
      case 0:
        return const DetailTips();
      case 1:
        return const DetailTips();
      case 2:
        return const DetailTips();
      case 3:
        return const DetailTips();
      case 4:
        return const DetailTips();
      default:
        return listTips();
    }
  }
}




// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class TipsPage extends StatefulWidget {
//   const TipsPage({super.key});

//   @override
//   State<TipsPage> createState() => _TipsPageState();
// }

// class _TipsPageState extends State<TipsPage> {
//   final List<Map<String, String>> articles = [
//     {
//       "title": "Apa Itu Jerawat?",
//       "description": "Jerawat adalah kondisi kulit yang umum terjadi, terutama selama masa pubertas. Ini disebabkan oleh penyumbatan pori-pori oleh minyak dan sel kulit mati."
//     },
//     {
//       "title": "Penyebab Jerawat",
//       "description": "Penyebab utama jerawat meliputi produksi minyak berlebih, penyumbatan pori-pori, dan infeksi bakteri. Hormon juga berperan dalam kemunculan jerawat."
//     },
//     {
//       "title": "Cara Mengatasi Jerawat",
//       "description": "Gunakan produk perawatan kulit yang mengandung bahan aktif seperti benzoyl peroxide atau asam salisilat untuk membantu mengatasi jerawat."
//     },
//     {
//       "title": "Pencegahan Jerawat",
//       "description": "Menjaga kebersihan kulit, menggunakan produk non-comedogenic, dan menghindari makanan tinggi gula dapat membantu mencegah jerawat."
//     },
//     {
//       "title": "Kapan Harus Mengunjungi Dokter?",
//       "description": "Jika jerawat Anda parah atau tidak kunjung membaik dengan perawatan rumahan, sebaiknya konsultasikan dengan dokter kulit."
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Tips Jerawat",
//           style: GoogleFonts.montserrat(fontSize: 20),
//         ),
//         backgroundColor: const Color.fromARGB(255, 0, 255, 238),
//       ),
//       body: ListView.builder(
//         itemCount: articles.length,
//         itemBuilder: (context, index) {
//           return Card(
//             margin: const EdgeInsets.all(8.0),
//             child: ListTile(
//               title: Text(
//                 articles[index]["title"]!,
//                 style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
//               ),
//               subtitle: Text(
//                 articles[index]["description"]!,
//                 style: GoogleFonts.montserrat(),
//               ),
//               onTap: () {
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
