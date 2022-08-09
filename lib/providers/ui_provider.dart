
import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier{

  int _selectedMenuOp = 0;

  int get selectedMenuOpt{
    return this._selectedMenuOp;
  }

  set SelectedMenuOpt(int i) {
    this._selectedMenuOp = i;
    notifyListeners();
  }

}