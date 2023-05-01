import 'package:flutter/material.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({
    Key? key,
    required this.selectedIndex,
    required this.callback,
  }) : super(key: key);

  final int selectedIndex;
  final void Function(int) callback;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      backgroundColor: Colors.white,
      currentIndex: selectedIndex,
      onTap: callback,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: "Favourites",
        ),
      ],
    );
  }
}
