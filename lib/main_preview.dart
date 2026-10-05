import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/theme_preview/theme_preview_screen.dart';

void main() {
  runApp(const ThemePreviewApp());
}

class ThemePreviewApp extends StatefulWidget {
  const ThemePreviewApp({Key? key}) : super(key: key);

  @override
  State<ThemePreviewApp> createState() => _ThemePreviewAppState();
}

class _ThemePreviewAppState extends State<ThemePreviewApp> {
  bool _isDark = true;

  void _toggleTheme() {
    setState(() {
      _isDark = !_isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theme Preview',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: ThemePreviewScreen(
        isDark: _isDark,
        onToggleTheme: _toggleTheme,
      ),
    );
  }
}
