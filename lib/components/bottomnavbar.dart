import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/chat.dart';
import 'package:flutter_application_2/screens/favourite.dart';
import 'package:flutter_application_2/screens/hero.dart';
import 'package:flutter_application_2/screens/host.dart';
import 'package:flutter_application_2/screens/trips.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap; // Callback to handle item tap

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap, // Callback to handle item tap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.car_repair),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_rounded),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit_road_sharp),
          label: 'Messages',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Profile',
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: Colors.grey,
      iconSize: 30.0, // Adjust icon size
      selectedFontSize: 12.0, // Adjust label font size
      unselectedFontSize: 12.0, // Adjust label font size
      onTap: (index) {
        onTap(index);
        // Navigate to a specific screen based on the tapped index
        if (index == 0) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Heroo()));
        }
        if (index == 1) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Host()));
        }
        if (index == 2) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Chat()));
        }
        if (index == 3) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Trips()));
        }
        if (index == 4) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Favourite()));
        }
        // Add navigation for other indices if needed
      },
    );
  }
}
