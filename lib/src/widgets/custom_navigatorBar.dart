import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      elevation: 0,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map"),
        BottomNavigationBarItem(icon: Icon(Icons.directions), label: "Places"),
      ],
    );
  }
}
