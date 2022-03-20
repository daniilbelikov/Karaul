import 'package:flutter/material.dart';

class BottomTabBarProvider with ChangeNotifier {
  PageController controller = PageController();
  int currentIndex = 0;

  get pageController => controller;
  get selectedIndex => currentIndex;

  void onPageChanged(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void onItemTapped(int index) {
    controller.jumpToPage(index);
    notifyListeners();
  }
}
