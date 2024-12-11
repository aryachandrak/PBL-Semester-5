import 'dart:io';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;
import 'dart:math' as math;

class ModelHelper {
  late Interpreter interpreter;
  late List<String> labels;

  Future<void> loadModel() async {
    interpreter = await Interpreter.fromAsset(
        'assets/models/inception_v3_finetuned_model.tflite');
    labels = [
      'Pustula',
      'fungal acne',
      'acne fulminans',
      'acne nodules',
      'papula'
    ];
  }

  Future<String> runModel(File image) async {
    final inputImage = await _preprocessImage(image);
    var output =
        List<double>.filled(labels.length, 0.0).reshape([1, labels.length]);
    interpreter.run(inputImage, output);

    final predictedIndex = output[0].indexOf(
        output[0].reduce((double a, double b) => math.max<double>(a, b)));
    return labels[predictedIndex];
  }

  Future<List<List<List<List<double>>>>> _preprocessImage(File image) async {
    // Membaca file gambar menjadi objek gambar
    final rawImage = img.decodeImage(image.readAsBytesSync())!;

    // Mengubah ukuran gambar ke 299x299
    final resizedImage = img.copyResize(rawImage, width: 299, height: 299);

    // Mengonversi gambar menjadi list of RGB, per pixel
    List<List<List<double>>> inputImage = [];
    for (int y = 0; y < resizedImage.height; y++) {
      List<List<double>> row = [];
      for (int x = 0; x < resizedImage.width; x++) {
        // Mengambil piksel dari gambar resized sebagai Pixel
        img.Pixel pixel = resizedImage.getPixel(x, y);

        // Ekstrak komponen warna dari Pixel
        double red = pixel.r / 255.0; // Red
        double green = pixel.g / 255.0; // Green
        double blue = pixel.b / 255.0; // Blue

        // Menyusun nilai RGB
        row.add([red, green, blue]);
      }
      inputImage.add(row);
    }

    // Menambahkan dimensi batch, sehingga inputImage menjadi [1, 299, 299, 3]
    return [inputImage]; // Tambahkan dimensi batch 1
  }
}
