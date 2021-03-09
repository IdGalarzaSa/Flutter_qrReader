import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/src/providers/ui_provider.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context);
    final currentIndexSelected = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      onTap: (int newIndexSelected) {
        uiProvider.selectedMenuOpt = newIndexSelected;
      },
      currentIndex: currentIndexSelected,
      elevation: 0,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map"),
        BottomNavigationBarItem(icon: Icon(Icons.directions), label: "Places"),
      ],
    );
  }
}
