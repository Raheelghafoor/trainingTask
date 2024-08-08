import 'package:flutter/material.dart';
import 'package:traning_task/Resource/resources.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      backgroundColor: Resource.colors.whiteColor,
      selectedItemColor: Resource.colors.textColor,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/home.png",
            height: 23,
            color: widget.currentIndex == 0 ? Colors.black : Colors.grey,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/Car Roof Box.png",
            height: 23,
            color: widget.currentIndex == 1 ? Colors.black : Colors.grey,
          ),
          label: 'Host',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/chaat.png",
            height: 23,
            color: widget.currentIndex == 2 ? Colors.black : Colors.grey,
          ),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/Road.png",
            height: 23,
            color: widget.currentIndex == 3 ? Colors.black : Colors.grey,
          ),
          label: 'Trip',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/favorite.png",
            height: 23,
            color: widget.currentIndex == 4 ? Colors.black: Colors.grey,
          ),
          label: 'Favorite',
        ),
      ],
    );
  }
}