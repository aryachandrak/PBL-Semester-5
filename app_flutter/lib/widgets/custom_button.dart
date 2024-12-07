import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? borderRadius;
  final double? widthFactor; // Faktor lebar berdasarkan ukuran layar
  final double? heightFactor; // Faktor tinggi berdasarkan ukuran layar
  final double? fontSizeFactor; // Faktor ukuran font
  final FontWeight? fontWeight;
  final IconData? icon;
  final BoxShadow? boxShadow;
  final List<Color>? gradientColors;
  final bool isFloating; // Tambahkan parameter untuk tombol mengambang

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.borderRadius = 8.0,
    this.widthFactor, // Default null (akan full width)
    this.heightFactor = 0.07, // Default: 7% dari tinggi layar
    this.fontSizeFactor = 0.02, // Default: 2% dari tinggi layar
    this.fontWeight = FontWeight.bold,
    this.icon,
    this.boxShadow,
    this.gradientColors = const [
      Color.fromARGB(255, 152, 241, 235),
      Color.fromARGB(255, 105, 205, 210),
    ],
    this.isFloating = false, // Default: tidak mengapung
  });

  @override
  Widget build(BuildContext context) {
    // Mendapatkan dimensi layar
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final shadow = boxShadow ?? BoxShadow(
      color: Colors.black.withOpacity(0.2), // Warna bayangan dengan opacity
      offset: Offset(0, 4), // Posisi bayangan (horizontal, vertical)
      blurRadius: 10, // Blur radius untuk kelembutan bayangan
      spreadRadius: 0, // Tidak ada penyebaran bayangan
    );

    return Container(
      width: widthFactor != null ? screenWidth * widthFactor! : double.infinity,
      height: screenHeight * (heightFactor ?? 0.07), // Default: 7% dari tinggi
      decoration: BoxDecoration(
        gradient: gradientColors != null
            ? LinearGradient(
                colors: gradientColors!,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            : null,
        borderRadius: BorderRadius.circular(borderRadius!),
        boxShadow: isFloating ? [shadow] : [], // Aktifkan bayangan jika floating
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, // Warna latar transparan
          shadowColor: Colors.transparent, // Bayangan menggunakan BoxDecoration
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
        ),
        onPressed: onPressed,
        child: icon == null
            ? Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize:
                      screenHeight * (fontSizeFactor ?? 0.02), // Responsif
                  fontWeight: fontWeight,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: textColor),
                  SizedBox(
                      width: screenWidth * 0.02), // Jarak antara ikon & teks
                  Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontSize:
                          screenHeight * (fontSizeFactor ?? 0.02), // Responsif
                      fontWeight: fontWeight,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
