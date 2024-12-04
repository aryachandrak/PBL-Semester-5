import 'package:flutter/material.dart';
import 'package:plugin_camera/widgets/profileOption_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Membuat teks tebal
            fontSize: 24, // Ukuran font
          ),
        ),
        backgroundColor: Colors.white, // Background AppBar putih
        foregroundColor: Colors.black, // Teks dan ikon berwarna hitam
        elevation: 0, // Menghilangkan bayangan AppBar
        centerTitle: true, // Memastikan judul berada di tengah
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.exit_to_app, color: Colors.red), // Ikon logout
        //     onPressed: () {
        //       // Tindakan ketika tombol logout ditekan
        //       print('Logout clicked');
        //     },
        //   ),
        // ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0), // Jarak kanan dan kiri
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue.shade700,
                borderRadius: BorderRadius.circular(16.0), // Sudut melengkung
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Warna bayangan
                    blurRadius: 10, // Besar blur
                    offset: Offset(0, 4), // Posisi bayangan (x, y)
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 35,
                    child: CircleAvatar(
                      radius: 32,
                      backgroundImage: AssetImage('assets/profile.jpg'), // Ganti dengan URL avatar Anda
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Nama User',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '@username',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            margin: const EdgeInsets.all(16.0),
            // padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                ProfileOption(
                  icon: Icons.person,
                  title: 'My Account',
                  subtitle: 'Make changes to your account',
                  page: 'EditAccount',
                ),
                ProfileOption(
                  icon: Icons.history,
                  title: 'Scan History',
                  subtitle: 'Your scan history',
                  page: 'ScanHistory',
                ),
                // ProfileOption(
                //     icon: Icons.upload,
                //     title: 'Your Post',
                //     subtitle: 'Your post',
                //     page: 'MyPost'),
                ProfileOption(
                    icon: Icons.notifications,
                    title: 'Notification',
                    subtitle: 'Your notification',
                    page: 'Notification'),
                ProfileOption(
                    icon: Icons.key,
                    title: 'Manage Password',
                    subtitle: 'Further secure your account for safety',
                    page: 'ManagePassword'),
                ProfileOption(
                    icon: Icons.logout,
                    title: 'Log out',
                    subtitle: 'Further secure your account for safety',
                    page: ''),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(
                16.0), // Menambahkan padding di sekitar teks
            child: Text(
              'More',
              style: TextStyle(
                color: Colors.grey, // Ganti dengan warna yang lebih mencolok
                fontSize: 18, // Ukuran font yang lebih besar
                fontWeight: FontWeight.bold, // Menebalkan teks untuk penekanan
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16.00), // Jarak vertikal
            // padding: const EdgeInsets.all(8.0), // Jarak dalam
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                ProfileOption(
                    icon: Icons.info,
                    title: 'About App',
                    subtitle: 'Everything about our App',
                    page: 'AboutApp'),
                ProfileOption(
                    icon: Icons.question_answer,
                    title: 'How To Use',
                    subtitle: 'Everything about our App',
                    page: 'AboutApp'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
