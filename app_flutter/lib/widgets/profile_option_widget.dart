import 'package:flutter/material.dart';
import 'package:plugin_camera/provider/navigation_provider.dart';
import 'package:provider/provider.dart';

Widget ProfileOption({
  required IconData icon,
  required String title,
  required String subtitle,
  VoidCallback? onTap,
}) {
  return ListTile(
    leading: CircleAvatar(
      backgroundColor: Colors.blue.shade100,
      child: Icon(
        icon,
        color: Colors.blue.shade700,
      ),
    ),
    title: Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    onTap: onTap,
  );
}
