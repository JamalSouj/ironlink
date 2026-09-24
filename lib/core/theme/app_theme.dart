import 'package:flutter/material.dart';

/// Application-wide design tokens and [ThemeData] factories.
///
/// Usage:
/// ```dart
/// MaterialApp.router(
///   theme: AppTheme.light,
///   darkTheme: AppTheme.dark,
/// );
/// ```
abstract final class AppTheme {
  static const _seedColor = Color(0xFF5B6EF5); // indigo-violet

  /// Light theme.
  static final ThemeData light = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.light,
    ),
    fontFamily: 'Inter',
  );

  /// Dark theme.
  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.dark,
    ),
    fontFamily: 'Inter',
  );
}
