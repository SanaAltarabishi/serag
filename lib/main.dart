import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serag/core/navigation/app_router.dart';
import 'package:serag/core/theme/theme_provider.dart';

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
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.currentTheme,
      themeMode: ThemeMode.system, //! ?
       routerDelegate: AppRouter.router.routerDelegate,
       routeInformationParser: AppRouter.router.routeInformationParser,
       routeInformationProvider: AppRouter.router.routeInformationProvider,
      // home: const SplashScreen(),
    );
  }
}
