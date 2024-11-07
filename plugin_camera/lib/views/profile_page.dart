// profile_page.dart
import 'package:flutter/material.dart';
import 'package:plugin_camera/models/profile_model.dart';
import 'package:provider/provider.dart';
import 'package:plugin_camera/views/history_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileModel(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 249, 249, 249),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.logout, color: Colors.black),
              onPressed: () {
                context.read<ProfileModel>().onLogout();
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.black),
              onPressed: () {
                context.read<ProfileModel>().onSettings();
              },
            ),
          ],
        ),
        body: Consumer<ProfileModel>(
          builder: (context, viewModel, child) {
            return Column(
              children: [
                const SizedBox(height: 16),
                Stack(
                  alignment: Alignment.center, // Menyusun elemen ke tengah
                  children: [
                    Container(
                      height: 300,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/acropolis.jpg'), // Ganti dengan jalur gambar
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment
                              .bottomRight, // Menempatkan ikon di pojok kanan bawah
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('assets/profile.jpg'),
                            ),
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.camera_alt,
                                  size: 15,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  // Tindakan untuk mengubah foto
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          viewModel.username,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255)
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          viewModel.email,
                          style:
                              const TextStyle(fontSize: 14, color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    children: [
                      ListTile(
                        leading: const Icon(Icons.person),
                        title: const Text('Account'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: viewModel.navigateToAccount,
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.notifications),
                        title: const Text('Notifications'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: viewModel.navigateToNotifications,
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.history),
                        title: const Text('Scan History'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () => viewModel.navigateToHistory(context),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.lock),
                        title: const Text('Passwords'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: viewModel.navigateToPasswords,
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.language),
                        title: const Text('Language'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: viewModel.navigateToLanguage,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
