import 'package:flutter/material.dart';

enum AppFragment { home, create }

class NavigationAdapter with ChangeNotifier {
  AppFragment _selectedFragment = AppFragment.home;

  AppFragment get selectedFragment => _selectedFragment;

  bool get allowBackNavigation => _selectedFragment != AppFragment.home;

  set selectedFragment(AppFragment fragment) {
    _selectedFragment = fragment;
    notifyListeners();
  }
}
