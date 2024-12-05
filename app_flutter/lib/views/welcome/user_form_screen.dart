import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plugin_camera/provider/user_provider.dart';
import 'package:plugin_camera/views/welcome/sign_up.dart';
import 'package:provider/provider.dart';

class UserFormScreen extends StatelessWidget {
  const UserFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(10),
        child: Container(
          color: const Color(0xFF4272FF),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  child: Icon(
                    Icons.chevron_left,
                    color: Color.fromARGB(255, 52, 50, 50),
                    size: 20,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 40),
              // Horizontal progress bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildProgressSegment(isActive: true),
                  _buildProgressSegment(),
                  _buildProgressSegment(),
                  _buildProgressSegment(),
                ],
              ),
              const SizedBox(height: 40),

              // Title and divider line
              const Text(
                'Cerita Sedikit Tentang Diri Anda',
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 30),

              // Form fields with mandatory indication and updated styles
              Row(
                children: [
                  Text('Nama', style: GoogleFonts.lexend(fontSize: 16)),
                  const Text('*', style: TextStyle(color: Colors.red)),
                ],
              ),
              TextFormField(
                onChanged: (value) => userProvider.setName(value),
                decoration: InputDecoration(
                  hintText: 'Masukkan nama Anda',
                  hintStyle:
                      GoogleFonts.lexend(color: Colors.grey, fontSize: 14),
                ),
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  Text('Jenis Kelamin',
                      style: GoogleFonts.lexend(fontSize: 16)),
                  const Text('*', style: TextStyle(color: Colors.red)),
                ],
              ),
              GestureDetector(
                onTap: () => _showGenderSelection(context),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 1),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black54,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        userProvider.gender ?? 'Pilih jenis kelamin',
                        style: GoogleFonts.lexend(
                          fontSize: 14,
                          color: userProvider.gender == null
                              ? Colors.grey
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  Text('Usia', style: GoogleFonts.lexend(fontSize: 16)),
                  const Text('*', style: TextStyle(color: Colors.red)),
                ],
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) => userProvider.setAge(int.parse(value)),
                decoration: InputDecoration(
                  hintText: 'Masukkan usia Anda',
                  hintStyle:
                      GoogleFonts.lexend(color: Colors.grey, fontSize: 14),
                ),
              ),
              const SizedBox(height: 20),

              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        if (userProvider.name.isNotEmpty &&
                            userProvider.gender != null &&
                            userProvider.age != null) {
                          await userProvider.saveUser();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Data disimpan')),
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NextPage()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'Pastikan mengisi semua data dengan benar')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4272FF),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                      ),
                      child: Text(
                        'Selanjutnya  >',
                        style: GoogleFonts.lexend(
                            fontSize: 15, color: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()),
                        );
                      },
                      child: Text(
                        'Lewati Orientasi',
                        style: GoogleFonts.lexend(
                          color: Colors.black,
                          fontSize: 15,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressSegment({bool isActive = false}) {
    return Container(
      width: 85,
      height: 5,
      decoration: BoxDecoration(
        color:
            isActive ? const Color(0xFF4272FF) : Colors.grey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  void _showGenderSelection(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Center(child: Text('Wanita')),
              onTap: () {
                userProvider.setGender('Wanita');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Center(child: Text('Pria')),
              onTap: () {
                userProvider.setGender('Pria');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Center(child: Text('Non Biner')),
              onTap: () {
                userProvider.setGender('Non Biner');
                Navigator.pop(context);
              },
            ),
            // const Divider(), // Divider between options and cancel button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0), // Add some padding to the button
                ),
                onPressed: () {
                  Navigator.pop(
                      context); // Close the bottom sheet without changes
                },
                child: Text('Batalkan',
                    style: GoogleFonts.lexend(
                        fontSize: 15)), // The text will be blue
              ),
            ),
          ],
        );
      },
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Selanjutnya")),
      body: const Center(child: Text("Tlhis is the next page.")),
    );
  }
}
