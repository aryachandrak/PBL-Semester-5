import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final double? widthFactor; // Faktor lebar berdasarkan ukuran layar
  final double? heightFactor; // Faktor tinggi berdasarkan ukuran layar
  final double? borderRadius; // Radius sudut kartu
  final Color? backgroundColor; // Warna latar belakang kartu
  final Widget child; // Isi kartu (konten)
  final VoidCallback? onTap; // Aksi saat kartu ditekan
  final EdgeInsetsGeometry? padding; // Padding di dalam kartu
  final BoxShadow? boxShadow; // Bayangan pada kartu

  const CustomCard({
    Key? key,
    this.widthFactor,
    this.heightFactor,
    this.borderRadius = 12.0,
    this.backgroundColor = Colors.white,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(16.0),
    this.boxShadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mendapatkan dimensi layar
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: widthFactor != null ? screenWidth * widthFactor! : double.infinity,
        height: heightFactor != null ? screenHeight * heightFactor! : null,
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius!),
          boxShadow: [
            boxShadow ??
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
          ],
        ),
        child: child,
      ),
    );
  }
}
