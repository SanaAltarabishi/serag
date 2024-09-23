import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serag/core/theme/theme_provider.dart';
import 'package:serag/features/entryPages/presentation/splash_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => ThemeProvider()..updateThemeBaseOnTime(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.currentTheme,
      themeMode: ThemeMode.system, //! ?
      home: const SplashScreen(),
    );
  }
}
//! if the app already opened how to change the theme without the need to close the app?
