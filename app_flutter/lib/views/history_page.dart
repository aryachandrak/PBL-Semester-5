import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plugin_camera/provider/camera_provider.dart';
import 'package:plugin_camera/provider/history_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plugin_camera/views/camera_page.dart';
import 'package:plugin_camera/views/scan_detail_page.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ScanHistoryPage extends StatefulWidget {
  const ScanHistoryPage({super.key});

  @override
  State<ScanHistoryPage> createState() => _ScanHistoryPageState();
}

class _ScanHistoryPageState extends State<ScanHistoryPage> {
  void deleteHistory(BuildContext context, String documentId, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Penghapusan'),
          content:
              const Text('Apakah Anda yakin ingin menghapus riwayat scan?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () async {
                try {
                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection('history')
                      .doc(documentId)
                      .delete();

                  setState(() {
                    Provider.of<HistoryProvider>(context, listen: false)
                        .historyItems
                        .removeAt(index);
                  });

                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('History berhasil dihapus')),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Terjadi kesalahan: $e')),
                  );
                }
              },
              child: const Text('Hapus'),
            ),
          ],
        );
      },
    );
  }
    @override
    void initState() {
      super.initState();
      final historyProvider = Provider.of<HistoryProvider>(context, listen: false);
      final currentUser = FirebaseAuth.instance.currentUser;
    
      if (currentUser != null) {
        historyProvider.fetchHistoryFromFirestore(currentUser.uid);
      }
    }
  @override
  Widget build(BuildContext context) {
    final cameras = Provider.of<CameraProvider>(context, listen: false).cameras;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Riwayat Scan',
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        // backgroundColor: Colors.white,
        // foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.face_retouching_natural_rounded),
            onPressed: () {
              // Aksi saat ikon scan wajah ditekan
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CameraPage(
                      cameras: cameras), // Navigasi ke halaman Face Scan
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer<HistoryProvider>(
        builder: (context, historyProvider, child) {
          if (historyProvider.historyItems.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.history_rounded,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Belum ada riwayat scan',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: historyProvider.historyItems.length,
            itemBuilder: (context, index) {
              historyProvider.historyItems
                  .sort((a, b) => b.scanTime.compareTo(a.scanTime));
              final scan = historyProvider.historyItems[index];
              final file = File(scan.imagePath);
              final formattedDate =
                  DateFormat('dd MMM yyyy, HH:mm').format(scan.scanTime);

              return Card(
                margin: const EdgeInsets.only(bottom: 16),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image Container
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          // Show full image when tapped
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => _FullScreenImage(
                                imagePath: scan.imagePath,
                                scanTime: formattedDate,
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag: scan.imagePath,
                          child: Image.file(
                            file,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: 200,
                                color: Colors.grey[200],
                                child: const Center(
                                  child: Icon(
                                    Icons.error_outline,
                                    color: Colors.grey,
                                    size: 48,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),

                    // Info Container
                    GestureDetector(
                      onTap: () {
                        // Navigate to the detail page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ScanDetailPage(
                              acneType: scan.acneType,
                              deskripsi: scan.deskripsi,
                              result: scan.result,
                              tips : scan.tips,
                              imagePath: scan.imagePath,
                              scanTime:
                                  formattedDate, // Pass the scan object to detail page
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Date and Time
                            Row(
                              children: [
                                const Icon(
                                  Icons.access_time_rounded,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  formattedDate,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),

                            // Acne Type
                            Text(
                              scan.acneType,
                              style: GoogleFonts.montserrat(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),

                            // Result
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blue[50],
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                scan.result,
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  color: Colors.blue[700],
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),

                            // Description
                            Text(
                              scan.deskripsi,
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                color: Colors.grey[700],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  // Panggil fungsi konfirmasi untuk menghapus history
                                  deleteHistory(
                                      context, scan.documentId, index);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// Full Screen Image View
class _FullScreenImage extends StatelessWidget {
  final String imagePath;
  final String scanTime;

  const _FullScreenImage({
    required this.imagePath,
    required this.scanTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          scanTime,
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      body: Center(
        child: Hero(
          tag: imagePath,
          child: Image.file(
            File(imagePath),
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                child: Icon(
                  Icons.error_outline,
                  color: Colors.white,
                  size: 64,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
