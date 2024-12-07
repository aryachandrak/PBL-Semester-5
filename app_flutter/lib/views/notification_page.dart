import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size.width * 0.05,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.04),
        child: ListView.separated(
          itemCount: 10, // Jumlah notifikasi
          separatorBuilder: (context, index) => SizedBox(height: size.height * 0.02),
          itemBuilder: (context, index) {
            return _buildNotificationCard(size, index);
          },
        ),
      ),
    );
  }

  Widget _buildNotificationCard(Size size, int index) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.04),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ikon notifikasi
            Container(
              width: size.width * 0.12,
              height: size.width * 0.12,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.notifications,
                color: Colors.blue,
                size: size.width * 0.06,
              ),
            ),
            SizedBox(width: size.width * 0.04),

            // Detail notifikasi
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Notification Title $index',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.045,
                    ),
                  ),
                  SizedBox(height: size.height * 0.005),
                  Text(
                    'This is a detailed description of the notification. It gives more context about the alert.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: size.width * 0.04,
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Text(
                    '2 hours ago',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: size.width * 0.035,
                    ),
                  ),
                ],
              ),
            ),

            // Tombol interaktif
            IconButton(
              onPressed: () {
                print('Notification $index dismissed');
              },
              icon: Icon(
                Icons.close,
                color: Colors.grey.shade500,
                size: size.width * 0.05,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
