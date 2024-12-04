import 'package:flutter/material.dart';
import 'package:plugin_camera/provider/navigation_provider.dart';
import 'package:provider/provider.dart';

Widget ProfileOption({
  required IconData icon,
  required String title,
  required String subtitle,
  required String page,
}) {
  return Builder(
    builder: (context) => ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue.shade100, // Warna latar lingkaran
        child: Icon(
          icon,
          color: Colors.blue.shade700, // Warna ikon
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(subtitle),
      onTap: () {
        // Memanggil navigateToPage dari NavigationProvider
        Provider.of<NavigationProvider>(context, listen: false).navigateToPage(context, page);
      },
    ),
  );
}
