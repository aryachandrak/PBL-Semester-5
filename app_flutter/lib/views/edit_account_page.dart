import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:plugin_camera/provider/navigation_provider.dart';
import 'package:plugin_camera/provider/profile_image_provider.dart';
import 'package:plugin_camera/views/main_page.dart';
import 'package:plugin_camera/widgets/custom_button.dart';
import 'package:plugin_camera/widgets/theme.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'package:provider/provider.dart';

class EditAccountPage extends StatefulWidget {
  const EditAccountPage({super.key});

  @override
  State<EditAccountPage> createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _nameController = TextEditingController();
  String _userName =
      FirebaseAuth.instance.currentUser?.displayName ?? 'Pengguna';
  String? _selectedGender;
  String? _profileImageUrl;

  Future<void> _updateProfile() async {
    final user = _auth.currentUser;
    final name = _nameController.text;

    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Name cannot be empty!')),
      );
      return;
    }
    if (user != null) {
      final userDoc = _firestore.collection('users').doc(user.uid);
      await userDoc.set({
        'name': _nameController.text,
        'gender': _selectedGender,
      }, SetOptions(merge: true));

      await user.updateDisplayName(name);

      setState(() {
        _userName =
            FirebaseAuth.instance.currentUser?.displayName ?? 'Pengguna';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully!')),
      );
    }
  }

  Future<String> _getLocalFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/profile_image.png';
  }

  Future<void> _loadProfileImage() async {
    try {
      final filePath = await _getLocalFilePath();
      final file = File(filePath);

      if (await file.exists()) {
        setState(() {
          _profileImageUrl = file.path;
        });
      } else {
        setState(() {
          _profileImageUrl = null;
        });
      }
    } catch (e) {
      setState(() {
        _profileImageUrl = null;
      });
    }
  }

  Future<void> _uploadProfileImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      try {
        final filePath = await _getLocalFilePath();
        final file = File(pickedImage.path);

        // Salin file ke lokasi penyimpanan lokal.
        await file.copy(filePath);

        Provider.of<ProfileImageProvider>(context, listen: false)
            .setProfileImagePath(filePath);
        setState(() {
          _profileImageUrl = filePath;
        });
        imageCache.clear();
        imageCache.clearLiveImages();
      } catch (e) {
        const SnackBar(content: Text('Error Uploading Image.'));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _loadProfileImage();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account'),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            final navigationProvider =
                Provider.of<NavigationProvider>(context, listen: false);
            navigationProvider.setIndex(3);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MainPage()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, // Padding horizontal 5% dari lebar
            vertical: size.height * 0.02, // Padding vertical 2% dari tinggi
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: _uploadProfileImage,
                  child: CircleAvatar(
                    key: UniqueKey(),
                    radius: size.width * 0.15,
                    backgroundColor: Colors.white,
                    backgroundImage: _profileImageUrl != null &&
                            File(_profileImageUrl!).existsSync()
                        ? FileImage(File(_profileImageUrl!))
                        : const AssetImage('assets/default-profile.jpg')
                            as ImageProvider,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Center(
                child: Text(
                  _userName,
                  style: TextStyle(
                    fontSize: size.width * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.04),
              _buildInputField(
                labelText: 'Full Name',
                controller: _nameController,
                size: size,
              ),
              SizedBox(height: size.height * 0.02),
              _buildDropdownField(
                labelText: 'Select your gender',
                items: ['Pilih gender', 'Male', 'Female', 'Other'],
                size: size,
                value: _selectedGender ?? 'Pilih gender',
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
              SizedBox(height: size.height * 0.04),
              CustomButton(
                text: 'Update Profile',
                onPressed: () {
                  _updateProfile();
                  print('Updated Profile');
                },
                widthFactor: 1.0,
                heightFactor: 0.06,
                fontSizeFactor: 0.02,
                borderRadius: 12.0,
                textColor: Colors.white,
                gradientColors: const [
                  Color(0xFF6DA06F),
                  Color(0xFF6DA06F),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String labelText,
    required Size size,
    required TextEditingController controller,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          floatingLabelStyle: TextStyle(color: primary),
          labelStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
            vertical: size.height * 0.02,
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required String labelText,
    required List<String> items,
    required Size size,
    required String? value,
    required void Function(String?) onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonFormField<String>(
        value: value, // Menampilkan nilai awal
        decoration: InputDecoration(
          labelText: labelText,
          floatingLabelStyle: TextStyle(color: primary),
          labelStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
            vertical: size.height * 0.015,
          ),
        ),
        items: items
            .map((gender) => DropdownMenuItem(
                  value: gender,
                  child: Text(
                    gender,
                    style: TextStyle(fontSize: size.width * 0.04),
                  ),
                ))
            .toList(),
        onChanged: onChanged, // Memperbarui nilai saat diubah
        dropdownColor: Colors.white,
      ),
    );
  }
}
