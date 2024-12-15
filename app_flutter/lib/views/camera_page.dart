import 'dart:io';
import 'package:camera/camera.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:media_scanner/media_scanner.dart';
import 'package:plugin_camera/models/acne_type_model.dart';
import 'package:plugin_camera/views/scan_detail_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CameraPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const CameraPage({super.key, required this.cameras});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late ModelHelper modelHelper;
  late CameraController cameraController;
  late Future<void> cameraValue;
  List<File> imagesList = [];
  bool isFlashOn = false;
  bool isRearCamera = true;
  bool isLoading = false;

  Future<File> saveImage(XFile image) async {
    final downlaodPath = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS);
    final fileName = '${DateTime.now().millisecondsSinceEpoch}.png';
    final file = File('$downlaodPath/$fileName');

    try {
      await file.writeAsBytes(await image.readAsBytes());
    } catch (_) {}

    return file;
  }

  void takePicture() async {
    XFile? image;

    if (cameraController.value.isTakingPicture ||
        !cameraController.value.isInitialized) {
      return;
    }

    setState(() {
      isLoading = true;
    });

    if (isFlashOn == false) {
      await cameraController.setFlashMode(FlashMode.off);
    } else {
      await cameraController.setFlashMode(FlashMode.torch);
    }
    image = await cameraController.takePicture();

    if (cameraController.value.flashMode == FlashMode.torch) {
      setState(() {
        cameraController.setFlashMode(FlashMode.off);
      });
    }

    final file = await saveImage(image);
    setState(() {
      imagesList.add(file);
    });
    MediaScanner.loadMedia(path: file.path);

    // Process acne detection
    final modelHelper = ModelHelper();
    await modelHelper.loadModel();

    final detections = await modelHelper.runModel(file);
    print('Detections: $detections');

    String acneType = 'unknown';
    String deskripsi = 'Gagal Mendeteksi Jenis Jerawat.';
    String tips = 'Disarankan untuk konsultasi dengan ahli kulit.';
    String result = 'Tingkat keparahan: Tidak dapat ditentukan';

    if (detections.isNotEmpty) {
      // Use the first detection's label
      acneType = detections.first['label']!.trim().toLowerCase();
      print(acneType);

      // Determine description, tips, and severity based on acne type
      switch (acneType) {
        case 'papules':
          deskripsi =
              '''Acne Papula adalah jerawat yang berbentuk benjolan merah tanpa nanah di dalamnya. Biasanya lebih besar dari komedo dan dapat terasa nyeri.''';
          tips = '''
Produk dengan Salicylic Acid: Membantu membersihkan pori-pori dan mengurangi peradangan.

Benzoyl Peroxide: Membunuh bakteri penyebab jerawat dan mengurangi peradangan.

Topical Retinoids: Meningkatkan pergantian sel kulit dan mengurangi pembentukan komedo.

Anti-inflamasi: Dapat digunakan dalam kasus peradangan yang lebih berat.

Peringatan: Hindari pemencetan jerawat karena dapat menyebabkan iritasi dan jaringan parut.''';
          result = 'Tingkat keparahan: Ringan sampai Sedang';
          break;
        case 'pustule':
          deskripsi =
              'Jerawat pustula ditandai dengan benjolan berisi nanah yang biasanya berwarna putih atau kuning di bagian atas. Bisa terasa nyeri dan kemerahan.';
          tips = '''
Gunakan pembersih yang mengandung Benzoyl Peroxide.

Hindari menyentuh atau memencet jerawat.

Gunakan produk anti-inflamasi.

Pertahankan kebersihan wajah dan gunakan pelembab non-comedogenic.''';
          result = 'Tingkat keparahan: Sedang';
          break;
        case 'nodule':
          deskripsi =
              'Jerawat nodul adalah jerawat besar, keras, dan menyakitkan yang terletak lebih dalam di kulit dan bisa menyebabkan bekas luka.';
          tips = '''
Konsultasi dengan dermatologis sangat direkomendasikan.

Mungkin memerlukan terapi oral antibiotik.

Hindari pemencetan atau pengobatan mandiri.

Pertimbangkan terapi isotretinoin di bawah pengawasan dokter.''';
          result = 'Tingkat keparahan: Berat';
          break;
        case 'whitehead':
          deskripsi =
              'Jerawat whitehead adalah komedo tertutup yang tersumbat oleh minyak dan sel kulit mati.';
          tips = '''
Gunakan produk dengan Salicylic Acid.

Lakukan eksfoliasi lembut secara teratur.

Gunakan pelembab non-comedogenic.

Hindari produk yang dapat menyumbat pori-pori.''';
          result = 'Tingkat keparahan: Ringan';
          break;
        case 'blackhead':
          deskripsi =
              'Komedo hitam adalah jerawat terbuka yang teroksidasi saat pori-pori tersumbat terkena udara.';
          tips = '''
Gunakan pembersih dengan Salicylic Acid.

Lakukan ekstraksi komedo secara profesional.

Gunakan clay mask untuk membersihkan pori-pori.

Hindari memencet komedo sendiri.''';
          result = 'Tingkat keparahan: Ringan';
          break;
        case 'bekas jerawat':
          deskripsi =
              'Komedo hitam adalah jerawat terbuka yang teroksidasi saat pori-pori tersumbat terkena udara.';
          tips = '''
Gunakan pembersih dengan Salicylic Acid.

Lakukan ekstraksi komedo secara profesional.

Gunakan clay mask untuk membersihkan pori-pori.

Hindari memencet komedo sendiri.''';
          result = 'Tingkat keparahan: Ringan';
          break;
        case 'pori-pori':
          deskripsi =
              'Komedo hitam adalah jerawat terbuka yang teroksidasi saat pori-pori tersumbat terkena udara.';
          tips = '''
Gunakan pembersih dengan Salicylic Acid.

Lakukan ekstraksi komedo secara profesional.

Gunakan clay mask untuk membersihkan pori-pori.

Hindari memencet komedo sendiri.''';
          result = 'Tingkat keparahan: Ringan';
          break;
      }
    }

    final scanTime = DateTime.now().toString();
    // final annotatedFile = await modelHelper.processAndSaveDetection(file);

    // Simpan ke Firestore
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userId = user.uid;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('history')
          .add({
        'acneType': acneType,
        'deskripsi': deskripsi,
        'result': result,
        'imagePath': file.path,
        'scanTime': scanTime,
        'tips': tips,
      });
    }

    setState(() {
      isLoading = false; // Selesai loading
    });

    // Navigasi ke ScanDetailPage
    if (context.mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScanDetailPage(
            acneType: acneType,
            deskripsi: deskripsi,
            result: result,
            imagePath: file.path,
            tips: tips,
            scanTime: scanTime,
          ),
        ),
      );
    }
  }

  void startCamera(int camera) {
    cameraController = CameraController(
      widget.cameras[camera],
      ResolutionPreset.high,
      enableAudio: false,
    );
    cameraValue = cameraController.initialize();
  }

  @override
  void initState() {
    super.initState();
    startCamera(1);
    modelHelper = ModelHelper();
    modelHelper.loadModel();
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(255, 255, 255, .7),
        shape: const CircleBorder(),
        onPressed: takePicture,
        child: const Icon(
          Icons.camera_alt,
          size: 40,
          color: Colors.black87,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(
        children: [
          FutureBuilder(
            future: cameraValue,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return SizedBox(
                  width: size.width,
                  height: size.height,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: 100,
                      child: CameraPreview(cameraController),
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 5, top: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isFlashOn = !isFlashOn;
                        });
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(50, 0, 0, 0),
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: isFlashOn
                              ? const Icon(
                                  Icons.flash_on,
                                  color: Colors.white,
                                  size: 30,
                                )
                              : const Icon(
                                  Icons.flash_off,
                                  color: Colors.white,
                                  size: 30,
                                ),
                        ),
                      ),
                    ),
                    const Gap(10),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isRearCamera = !isRearCamera;
                        });
                        isRearCamera ? startCamera(0) : startCamera(1);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(50, 0, 0, 0),
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: isRearCamera
                              ? const Icon(
                                  Icons.camera_rear,
                                  color: Colors.white,
                                  size: 30,
                                )
                              : const Icon(
                                  Icons.camera_front,
                                  color: Colors.white,
                                  size: 30,
                                ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 7, bottom: 75),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: imagesList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(2),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                height: 100,
                                width: 100,
                                opacity: const AlwaysStoppedAnimation(07),
                                image: FileImage(
                                  File(imagesList[index].path),
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
