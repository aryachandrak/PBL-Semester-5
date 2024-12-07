import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:plugin_camera/provider/navigation_provider.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  final List<CameraDescription> cameras;

  const SignUpPage({super.key, required this.cameras});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Logo
            Center(
              child: Column(
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape
                          .circle, // Opsional: Membuat gambar berbentuk lingkaran
                    ),
                    child: Image.asset(
                      'assets/logoCoba.png', // Path gambar lokal
                      fit: BoxFit.cover, // Atur sesuai kebutuhan
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return Icon(
                          Icons.error, // Ikon fallback jika gambar gagal dimuat
                          size: 40,
                          color: Colors.red,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Hello There!',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Let's glow together with us",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            // Nama Field
            // Nama Field
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline),
                labelText: 'Nama',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey, // Warna border abu-abu saat tidak fokus
                    width: 2.0, // Ketebalan border
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey, // Warna border abu-abu saat fokus
                    width: 3.0, // Ketebalan border lebih tebal saat fokus
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),

            SizedBox(height: 16),
// Email Field
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey, // Warna border abu-abu saat tidak fokus
                    width: 2.0, // Ketebalan border
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey, // Warna border abu-abu saat fokus
                    width: 3.0, // Ketebalan border lebih tebal saat fokus
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),

            SizedBox(height: 16),
// Password Field
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey, // Warna border abu-abu saat tidak fokus
                    width: 2.0, // Ketebalan border
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey, // Warna border abu-abu saat fokus
                    width: 3.0, // Ketebalan border lebih tebal saat fokus
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),

            SizedBox(height: 24),
            // Tombol Lanjutkan
            GestureDetector(
              onTap: () {
                context
                    .read<NavigationProvider>()
                    .navigateToPage(context, 'Home', arguments: cameras);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF6DA06F), // Warna hijau pada tombol
                  borderRadius: BorderRadius.circular(16), // Sudut membulat
                ),
                padding:
                    EdgeInsets.symmetric(vertical: 14), // Padding dalam tombol
                child: Center(
                  child: Text(
                    'Lanjutkan',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Warna teks putih
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            // Divider atau pemisah
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey[400],
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Atau',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey[400],
                    thickness: 1,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            // Tombol Google Login
            GestureDetector(
              onTap: () {
                print("Google login pressed");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://bmw.astra.co.id/wp-content/uploads/2023/07/BMW.svg_-300x300.png', // Path logo Google
                    width: 24,
                    height: 24,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Login dengan Google',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            // Footer
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Punya akun? ',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context
                          .read<NavigationProvider>()
                          .navigateToPage(context, 'Home', arguments: cameras);
                    },
                    child: Text(
                      'Masuk',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6DA06F),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
