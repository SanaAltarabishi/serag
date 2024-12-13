import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serag/core/config/flavor_config.dart';
import 'package:serag/core/theme/theme_provider.dart';
import 'package:serag/my_app.dart';

void main() {
  FlavorConfig.setFlavor(FlavorConfig.staging);
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider()..updateThemeBaseOnTime(),
      child: const MyApp(),
    ),
  );
}
