import 'package:flutter/material.dart';

class UIProvider extends ChangeNotifier {
  int _selectedMenuOpt = 0;

  int get selectedMenuOpt {
    return this._selectedMenuOpt;
  }

  set selectedMenuOpt(int newSelectedMenuOpt) {
    this._selectedMenuOpt = newSelectedMenuOpt;
    notifyListeners();
  }
}
