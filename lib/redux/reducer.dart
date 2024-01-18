import 'package:flutter/material.dart';
import 'package:spyke/redux/action.dart';
import 'package:spyke/redux/appstate.dart';

AppState appReducer(AppState prevState, dynamic action) {
  if (action is ToggleThemeAction) {
    return AppState(themeMode: toggleThemeMode(action.isDarkMode));
  }

  return prevState;
}

ThemeMode toggleThemeMode(bool isOn) {
  return isOn ? ThemeMode.dark : ThemeMode.light;
}
