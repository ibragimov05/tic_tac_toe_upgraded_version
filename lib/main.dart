import 'dart:ffi';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_upgraded_version/views/screens/main_screen/screen/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(App(savedThemeMode: savedThemeMode));
}

class App extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const App({super.key, this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.blue,
      ),
      dark: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blue,
      ),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (light, dark) => MaterialApp(
        darkTheme: dark,
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        //   appBarTheme: const AppBarTheme(
        //     backgroundColor: Color(0xFFd5f7f7),
        //     titleTextStyle: TextStyle(
        //       color: Colors.cyan,
        //       fontWeight: FontWeight.w700,
        //       fontSize: 25,
        //     ),
        //   ),
        //   scaffoldBackgroundColor: const Color(0xFFedfcfc),
        // ),
        home: const MainScreen(),
      ),
      debugShowFloatingThemeButton: true,
    );
  }
}
