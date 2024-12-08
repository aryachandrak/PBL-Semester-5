import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plugin_camera/provider/navigation_provider.dart';
import 'package:plugin_camera/widgets/profile_option_widget.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final userName = FirebaseAuth.instance.currentUser?.displayName ?? 'Pengguna';
  final userEmail =
      FirebaseAuth.instance.currentUser?.email ?? 'Email tidak tersedia';
  signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Profile',
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
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
                color: Colors.cyan.shade700,
                borderRadius: BorderRadius.circular(16.0), // Sudut melengkung
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Warna bayangan
                    blurRadius: 10, // Besar blur
                    offset: const Offset(0, 4), // Posisi bayangan (x, y)
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
                      backgroundImage: AssetImage(
                          'assets/profile.jpg'), // Ganti dengan URL avatar Anda
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        userEmail,
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
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                ProfileOption(
                  icon: Icons.person,
                  title: 'My Account',
                  subtitle: 'Make changes to your account',
                  onTap: () {
                    // Memanggil navigateToPage dari Navig  ationProvider
                    Provider.of<NavigationProvider>(context, listen: false)
                        .navigateToPage(context, 'EditAccount');
                  },
                ),
                ProfileOption(
                  icon: Icons.history,
                  title: 'Scan History',
                  subtitle: 'Your scan history',
                  onTap: () {
                    // Memanggil navigateToPage dari Navig  ationProvider
                    Provider.of<NavigationProvider>(context, listen: false)
                        .navigateToPage(context, 'ScanHistory');
                  },
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
                  onTap: () {
                    // Memanggil navigateToPage dari Navig  ationProvider
                    Provider.of<NavigationProvider>(context, listen: false)
                        .navigateToPage(context, 'Notification');
                  },
                ),
                ProfileOption(
                  icon: Icons.key,
                  title: 'Manage Password',
                  subtitle: 'Further secure your account for safety',
                  onTap: () {
                    // Memanggil navigateToPage dari Navig  ationProvider
                    Provider.of<NavigationProvider>(context, listen: false)
                        .navigateToPage(context, 'ManagePassword');
                  },
                ),
                ProfileOption(
                  icon: Icons.logout,
                  title: 'Log out',
                  subtitle: 'Further secure your account for safety',
                  onTap: () async {
                    await signOut();
                    context.read<NavigationProvider>().navigateToPage(
                          context,
                          'login',
                        );
                  },
                ),
              ],
            ),
          ),
          const Padding(
            padding:
                EdgeInsets.all(16.0), // Menambahkan padding di sekitar teks
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
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                ProfileOption(
                  icon: Icons.info,
                  title: 'About App',
                  subtitle: 'Everything about our App',
                  onTap: () {
                    // Memanggil navigateToPage dari Navig  ationProvider
                    Provider.of<NavigationProvider>(context, listen: false)
                        .navigateToPage(context, 'AboutApp');
                  },
                ),
                ProfileOption(
                  icon: Icons.question_answer,
                  title: 'How To Use',
                  subtitle: 'Everything about our App',
                  onTap: () {
                    // Memanggil navigateToPage dari Navig  ationProvider
                    Provider.of<NavigationProvider>(context, listen: false)
                        .navigateToPage(context, 'AboutApp');
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
