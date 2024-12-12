import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/navigation_provider.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final navbarProvider = Provider.of<NavigationProvider>(context);

    return BottomNavigationBar(
      currentIndex: navbarProvider.currentIndex,
      onTap: (index) => navbarProvider.setIndex(index),
      type: BottomNavigationBarType.fixed, // Add this line
      backgroundColor: Colors.white,
      elevation: 8,
      selectedItemColor: const Color(0xFF6DA06F),
      unselectedItemColor: Colors.grey[600],
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'History',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.lightbulb),
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
