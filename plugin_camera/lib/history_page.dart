import 'package:flutter/material.dart';

class ScanHistoryPage extends StatelessWidget {
  const ScanHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan History'),
      ),
      body: Center(
        child: Text('Daftar Scan History Anda akan tampil di sini'),
      ),
    );
  }
}
