import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier{
  int currentIndex = 0;

  void changeTab(int newIndex){
    if(currentIndex == newIndex){
      return;
    }
    currentIndex = newIndex;
    notifyListeners();
  }
}