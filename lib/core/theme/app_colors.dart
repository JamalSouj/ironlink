import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color background;
  final Color surface1;
  final Color surface2;
  final Color textPrimary;
  final Color textSecondary;
  final Color accent;
  final Color effortLow;
  final Color effortHigh;
  final Color success;

  const AppColors({
    required this.background,
    required this.surface1,
    required this.surface2,
    required this.textPrimary,
    required this.textSecondary,
    required this.accent,
    required this.effortLow,
    required this.effortHigh,
    required this.success,
  });

  // Default Dark Mode
  static const AppColors dark = AppColors(
    background: Color(0xFF121316),
    surface1: Color(0xFF1B1D22),
    surface2: Color(0xFF23262C),
    textPrimary: Color(0xFFF2F2F0),
    textSecondary: Color(0xFF8B8D94),
    accent: Color(0xFF5B6EF5),
    effortLow: Color(0xFFF2A93B),
    effortHigh: Color(0xFFE85D4A),
    success: Color(0xFF4FD1A5),
  );

  // Light Mode (for coach dashboard)
  static const AppColors light = AppColors(
    background: Color(0xFFFAFAF8),
    surface1: Color(0xFFFFFFFF),
    surface2: Color(0xFFF0F2F5),
    textPrimary: Color(0xFF1A1B1E),
    textSecondary: Color(0xFF8B8D94), // or 0xFF6C6F75 for better contrast
    accent: Color(0xFF5B6EF5),
    effortLow: Color(0xFFF2A93B),
    effortHigh: Color(0xFFE85D4A),
    success: Color(0xFF4FD1A5),
  );

  @override
  ThemeExtension<AppColors> copyWith({
    Color? background,
    Color? surface1,
    Color? surface2,
    Color? textPrimary,
    Color? textSecondary,
    Color? accent,
    Color? effortLow,
    Color? effortHigh,
    Color? success,
  }) {
    return AppColors(
      background: background ?? this.background,
      surface1: surface1 ?? this.surface1,
      surface2: surface2 ?? this.surface2,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      accent: accent ?? this.accent,
      effortLow: effortLow ?? this.effortLow,
      effortHigh: effortHigh ?? this.effortHigh,
      success: success ?? this.success,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      background: Color.lerp(background, other.background, t)!,
      surface1: Color.lerp(surface1, other.surface1, t)!,
      surface2: Color.lerp(surface2, other.surface2, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      effortLow: Color.lerp(effortLow, other.effortLow, t)!,
      effortHigh: Color.lerp(effortHigh, other.effortHigh, t)!,
      success: Color.lerp(success, other.success, t)!,
    );
  }
}
