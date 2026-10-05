import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData get dark {
    final colors = AppColors.dark;
    return _buildTheme(colors, Brightness.dark);
  }

  static ThemeData get light {
    final colors = AppColors.light;
    return _buildTheme(colors, Brightness.light);
  }

  static ThemeData _buildTheme(AppColors appColors, Brightness brightness) {
    final textTheme = AppTextStyles.createTextTheme(appColors);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: appColors.background,
      primaryColor: appColors.accent,
      focusColor: appColors.accent, // High contrast focus for web/keyboard
      highlightColor: Colors.transparent, // Remove splash noise
      splashColor: Colors.transparent,    // Remove material ripple noise
      
      // Extensions give us easy access to our custom colors
      extensions: [
        appColors,
      ],
      
      // Map to Material ColorScheme for native widgets
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: appColors.accent,
        onPrimary: appColors.textPrimary,
        secondary: appColors.surface2,
        onSecondary: appColors.textPrimary,
        error: appColors.effortHigh,
        onError: appColors.textPrimary,
        surface: appColors.surface1,
        onSurface: appColors.textPrimary,
      ),

      textTheme: textTheme,
      
      // Global Component Themes to enforce the brutalist/sharp geometry
      cardTheme: CardTheme(
        color: appColors.surface1,
        elevation: 0, // No drop shadows
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          // Minimal radius, relying on layout/color over shadow
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(
            color: appColors.surface2, // Use elevated tone as a subtle border if needed
            width: 1,
          ),
        ),
      ),
      
      appBarTheme: AppBarTheme(
        backgroundColor: appColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: textTheme.headlineMedium,
        iconTheme: IconThemeData(color: appColors.textPrimary),
      ),
      
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appColors.accent,
          foregroundColor: Colors.white,
          elevation: 0, // No shadows
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          textStyle: textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: appColors.accent,
          textStyle: textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: appColors.surface1,
        elevation: 0,
        selectedItemColor: appColors.accent,
        unselectedItemColor: appColors.textSecondary,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
