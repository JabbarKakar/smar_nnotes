
import 'package:flutter/material.dart';

class WorkbenchProvider extends ChangeNotifier{
  bool _isBold = false;
  get isBold => _isBold;

  void toggleBold(){
    _isBold =! isBold;
    notifyListeners();
  }

  bool _changeColor = false;
  get changeColor => _changeColor;

  void changeColor1(){
    _changeColor =! changeColor;
    notifyListeners();
  }

  bool _underlineText = false;
  get underlineText => _underlineText;

  void textDecoration(){
    _underlineText =! underlineText;
    notifyListeners();
  }

}