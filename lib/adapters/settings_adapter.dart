import 'package:flutter/material.dart';

import './services/settings_service.dart';

class SettingsAdapter with ChangeNotifier {
  late final SettingsService _service;
  late ThemeMode _themeMode;

  SettingsAdapter() {
    _service = SettingsService();
    _themeMode = ThemeMode.dark;
  }

  ThemeMode get themeMode => _themeMode;

  ThemeData get lightTheme {
    const Color lightSeed = Color.fromARGB(255, 4, 105, 10);
    var lightColourScheme = ColorScheme.fromSeed(seedColor: lightSeed);
    return ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey[300],
        dialogBackgroundColor: Colors.grey[400],
        colorScheme: lightColourScheme,
        secondaryHeaderColor: lightSeed,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: lightColourScheme.primary,
          backgroundColor: lightColourScheme.secondaryContainer,
        ));
  }

  ThemeData get darkTheme {
    const Color darkSeed = Color.fromARGB(255, 66, 173, 73);
    return ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey[900],
        dialogBackgroundColor: Colors.grey[850],
        colorScheme: ColorScheme.fromSeed(seedColor: darkSeed),
        textTheme: ThemeData.dark().textTheme.apply(
              bodyColor: Colors.white70,
              displayColor: Colors.white60,
            ),
        secondaryHeaderColor: darkSeed,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: darkSeed,
          backgroundColor: Colors.grey[800],
        ));
  }

  Future<void> loadSettings() async {
    await _service.init();
    _themeMode = await _service.themeMode();
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    if (_themeMode == ThemeMode.dark) {
      _themeMode = ThemeMode.light;
    } else {
      _themeMode = ThemeMode.dark;
    }

    notifyListeners();
    await _service.toggleThemeMode();
  }
}
