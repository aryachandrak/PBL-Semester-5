import 'dart:io';
import 'package:external_path/external_path.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;
import 'dart:math' as math;

class ModelHelper {
  late Interpreter interpreter;
  final List<String> labels = [
    'Bekas Jerawat',
    'Blackhead',
    'Nodule',
    'Papules',
    'Pori-Pori',
    'Pustule',
    'Whitehead',
  ];

  Future<void> loadModel() async {
    // Load model YOLOv5
    interpreter = await Interpreter.fromAsset('assets/models/best-fp16.tflite');
  }

  Future<List<List<List<List<double>>>>> _preprocessImage(File image) async {
    // Decode the image file
    final rawImage = img.decodeImage(image.readAsBytesSync())!;

    // Resize image to 640x640
    final resizedImage = img.copyResize(rawImage, width: 640, height: 640);

    // Normalize and reshape the image to [1, 640, 640, 3]
    final inputImage = List.generate(
      640,
      (y) => List.generate(
        640,
        (x) {
          final pixel = resizedImage.getPixel(x, y);
          return [
            pixel.r / 255.0, // Red channel
            pixel.g / 255.0, // Green channel
            pixel.b / 255.0, // Blue channel
          ];
        },
      ),
    );

    return [inputImage]; // Add batch dimension
  }

  Future<List<Map<String, String>>> runModel(File image) async {
    // Preprocess image to match YOLOv5 input requirements
    final inputImage = await _preprocessImage(image);

    // Output tensor structure: [1, N, 12], where N = number of detections
    // Each detection contains [x, y, w, h, confidence, class_scores...]
    var output = List.generate(
        1, (batch) => List.generate(25200, (box) => List.filled(12, 0.0)));

    // Run inference
    interpreter.run(inputImage, output);
    // Post-process the output
    return _postProcessOutput(output[0]);
  }

  List<Map<String, String>> _postProcessOutput(List<List<double>> output) {
    const double confidenceThreshold = 0.15;
    const double iouThreshold = 0.15;

    // Filter predictions by confidence threshold
    final detections = output
        .where((detection) => detection[4] > confidenceThreshold)
        .map((detection) {
      final double x = detection[0];
      final double y = detection[1];
      final double w = detection[2];
      final double h = detection[3];
      final double confidence = detection[4];
      final classIndex =
          detection.sublist(5).indexOf(detection.sublist(5).reduce(math.max));
      return {
        'label': labels[classIndex], // Map class index to label
        'confidence': confidence.toStringAsFixed(2),
        'x': x.toString(), // Convert to String
        'y': y.toString(), // Convert to String
        'w': w.toString(), // Convert to String
        'h': h.toString(), // Convert to String
      };
    }).toList();
    // Apply Non-Maximum Suppression (NMS)
    return _nonMaximumSuppression(detections, iouThreshold);
  }

  List<Map<String, String>> _nonMaximumSuppression(
      List<Map<String, String>> detections, double iouThreshold) {
    detections.sort((a, b) => double.parse(b['confidence']!)
        .compareTo(double.parse(a['confidence']!)));

    final List<Map<String, String>> results = [];
    while (detections.isNotEmpty) {
      final best = detections.removeAt(0);
      results.add(best);

      print('BESTTTTTT:  $best');
      print(detections);
      detections.removeWhere(
          (detection) => _calculateIoU(best, detection) > iouThreshold);
    }
    return results;
  }

  double _calculateIoU(Map<String, String> boxA, Map<String, String> boxB) {
    final double xA =
        math.max(double.parse(boxA['x']!), double.parse(boxB['x']!));
    final double yA =
        math.max(double.parse(boxA['y']!), double.parse(boxB['y']!));
    final double xB = math.min(
        double.parse(boxA['x']!) + double.parse(boxA['w']!),
        double.parse(boxB['x']!) + double.parse(boxB['w']!));
    final double yB = math.min(
        double.parse(boxA['y']!) + double.parse(boxA['h']!),
        double.parse(boxB['y']!) + double.parse(boxB['h']!));

    final double interArea = math.max(0, xB - xA) * math.max(0, yB - yA);

    final double boxAArea = double.parse(boxA['w']!) * double.parse(boxA['h']!);
    final double boxBArea = double.parse(boxB['w']!) * double.parse(boxB['h']!);

    return interArea / (boxAArea + boxBArea - interArea);
  }

  Future<File> processAndSaveDetection(File image) async {
    // Jalankan model dan dapatkan hasil deteksi
    final detections = await runModel(image);

    // Decode gambar asli
    final rawImage = img.decodeImage(image.readAsBytesSync())!;

    // Tambahkan bounding box dan label untuk setiap deteksi
    for (var detection in detections) {
      final x = double.parse(detection['x']!); // Koordinat X awal
      final y = double.parse(detection['y']!); // Koordinat Y awal
      final w = double.parse(detection['w']!); // Lebar bounding box
      final h = double.parse(detection['h']!); // Tinggi bounding box

      // Gambarkan bounding box
      if (detection['confidence'] != null &&
          double.parse(detection['confidence']!) > 0.2) {
        img.drawRect(
          rawImage,
          x1: x.toInt(),
          y1: y.toInt(),
          x2: (x + w).toInt(),
          y2: (y + h).toInt(),
          color: img.ColorInt32(0xFFFF0000),
          thickness: 2,
        );

        img.drawString(
          rawImage,
          '${detection['label']} (${detection['confidence']}%)',
          font: img.arial24,
          x: x.toInt(),
          y: math.max(0, y.toInt() - 20),
          color: img.ColorInt32(0xFFFFFFFF),
        );
      }
    }

    // Simpan gambar hasil anotasi
    final annotatedImagePath =
        '${(await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS))}/${DateTime.now().millisecondsSinceEpoch}_detected.png';
    final annotatedFile = File(annotatedImagePath);
    await annotatedFile.writeAsBytes(img.encodePng(rawImage));

    return annotatedFile;
  }
}
