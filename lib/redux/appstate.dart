import 'package:flutter/material.dart';

class AppState {
  final ThemeMode themeMode;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  AppState({required this.themeMode});

  factory AppState.initialize() => AppState(themeMode: ThemeMode.light);
}
