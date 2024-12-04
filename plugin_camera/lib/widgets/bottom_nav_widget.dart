import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/navigation_provider.dart';

class BottomNavWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navbarProvider = Provider.of<NavigationProvider>(context);

    return BottomNavigationBar(
      currentIndex: navbarProvider.currentIndex,
      onTap: (index) => navbarProvider.setIndex(index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'Laporan',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
