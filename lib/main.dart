import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:redux/redux.dart';
import 'package:spyke/redux/appstate.dart';
import 'package:spyke/redux/reducer.dart';
import 'package:spyke/scenes/splash.dart';
import 'package:spyke/utility/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final title = 'Spyke';

  final Store<AppState> _store = Store<AppState>(
    appReducer,
    initialState: AppState.initialize(),
  );

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: _store,
      child: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (_, themeModeState) => GetMaterialApp(
          title: title,
          debugShowCheckedModeBanner: false,
          themeMode: themeModeState.themeMode,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: SplashScreen(title: title,),
        ),
      ),
    );
  }
}
