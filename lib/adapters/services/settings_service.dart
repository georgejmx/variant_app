import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  late SharedPreferences prefs;

  // Initialise required shared preferences, needed at startup
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('is_variant_dark') == null) {
      await prefs.setBool('is_variant_dark', true);
    }
  }

  // Parse a theme of light or dark from shared preferences
  Future<ThemeMode> themeMode() async {
    bool? isVariantDark = prefs.getBool('is_variant_dark');
    if (isVariantDark == null || isVariantDark == true) {
      return ThemeMode.dark;
    }
    return ThemeMode.light;
  }

  // Update theme stored in shared preferences
  Future<void> toggleThemeMode() async {
    bool? isVariantDark = prefs.getBool('is_variant_dark');
    if (isVariantDark == null || isVariantDark == true) {
      await prefs.setBool('is_variant_dark', false);
      return;
    }
    await prefs.setBool('is_variant_dark', true);
  }
}
