import 'package:bookia/core/routers/routers.dart';
import 'package:bookia/core/utils/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routes.routers,
      theme: AppThemes.lightTheme(),
      debugShowCheckedModeBanner: false,    
    );
  }
}
