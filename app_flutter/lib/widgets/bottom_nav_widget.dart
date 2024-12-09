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
      // backgroundColor: const Color(0xFF6DA06F),
      selectedItemColor: const Color.fromARGB(255, 105, 205, 210),
      unselectedItemColor: Colors.grey,
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
          icon: Icon(Icons.lightbulb_outline),
          label: 'Tips',
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.timer_outlined),
        //   label: 'Rutinitas',
        // ),

        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
