import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_upgraded_version/utils/app_constants.dart';
import 'package:tic_tac_toe_upgraded_version/views/screens/main_screen/screen/main_screen.dart';
import 'package:tic_tac_toe_upgraded_version/views/widgets/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  AppConstants.isLight = await AppConstants.getIsLight;
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'), // Corrected locale
        Locale('ru'), // Russian
        Locale('uz'), // Uzbek
      ],
      path: 'resources/langs',
      fallbackLocale: const Locale('uz'),
      // Ensure this is also correct
      startLocale: const Locale('en'),
      // Ensure consistency
      child: App(savedThemeMode: savedThemeMode),
    ),
  );
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
      ),
      dark: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (ThemeData light, ThemeData dark) => MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        darkTheme: dark,
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          backgroundColor: AppConstants.isLight
              ? const Color(0xFFedfcfc)
              : const Color(0xFF31363F),
          duration: 3000,
          splashTransition: SplashTransition.fadeTransition,
          splash: const SplashWidget(),
          splashIconSize: 150,
          nextScreen: const MainScreen(),
        ),
      ),
    );
  }
}