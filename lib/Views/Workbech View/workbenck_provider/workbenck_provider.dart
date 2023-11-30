
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


  Color textColor = Colors.white;
  // late int currentIndex; // New property to store the current index

  void changeTextColor(Color color) {
    textColor = color;
    notifyListeners();
  }

  // void setCurrentIndex(int index) {
  //   currentIndex = index;
  // }

}