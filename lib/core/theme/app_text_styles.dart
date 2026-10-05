import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Base font families
  static final String _uiFontFamily = GoogleFonts.inter().fontFamily!;
  static final String _dataFontFamily = GoogleFonts.jetbrainsMono().fontFamily!;

  // Build the complete TextTheme based on the provided colors
  static TextTheme createTextTheme(AppColors colors) {
    return TextTheme(
      // DISPLAY: Large numbers, hero stats, major level-up moments
      displayLarge: TextStyle(
        fontFamily: _dataFontFamily,
        fontSize: 48,
        fontWeight: FontWeight.w400,
        color: colors.textPrimary,
        letterSpacing: -1.0,
      ),
      displayMedium: TextStyle(
        fontFamily: _dataFontFamily,
        fontSize: 40,
        fontWeight: FontWeight.w400,
        color: colors.textPrimary,
        letterSpacing: -0.5,
      ),
      displaySmall: TextStyle(
        fontFamily: _uiFontFamily,
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: colors.textPrimary,
        letterSpacing: -0.5,
      ),
      
      // HEADLINE: Page titles, major sections
      headlineLarge: TextStyle(
        fontFamily: _uiFontFamily,
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: colors.textPrimary,
        letterSpacing: -0.5,
      ),
      headlineMedium: TextStyle(
        fontFamily: _uiFontFamily,
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: colors.textPrimary,
      ),
      headlineSmall: TextStyle(
        fontFamily: _uiFontFamily,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: colors.textPrimary,
      ),

      // TITLE: Card headers, list items
      titleLarge: TextStyle(
        fontFamily: _uiFontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: colors.textPrimary,
      ),
      titleMedium: TextStyle(
        fontFamily: _uiFontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: colors.textPrimary,
      ),
      titleSmall: TextStyle(
        fontFamily: _uiFontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: colors.textPrimary,
      ),

      // BODY: Prose, descriptions, long text
      bodyLarge: TextStyle(
        fontFamily: _uiFontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: colors.textSecondary,
        height: 1.5,
      ),
      bodyMedium: TextStyle(
        fontFamily: _uiFontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: colors.textSecondary,
        height: 1.5,
      ),
      bodySmall: TextStyle(
        fontFamily: _uiFontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: colors.textSecondary,
        height: 1.4,
      ),

      // LABEL: Small UI elements, overlines. 
      // Not bold/all-caps by default as per constraints.
      labelLarge: TextStyle(
        fontFamily: _uiFontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: colors.textSecondary,
      ),
      labelMedium: TextStyle(
        fontFamily: _uiFontFamily,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: colors.textSecondary,
      ),
      labelSmall: TextStyle(
        fontFamily: _uiFontFamily,
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: colors.textSecondary,
      ),
    );
  }

  /// Specialized style for precise tabular data (sets, reps, RPE, weight).
  /// Use this explicitly when rendering numbers that matter.
  static TextStyle dataStyle(AppColors colors, {double fontSize = 16, FontWeight fontWeight = FontWeight.w400}) {
    return TextStyle(
      fontFamily: _dataFontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: colors.textPrimary,
      // Important for monospace numerals not to feel clunky
      letterSpacing: 0,
      fontFeatures: const [FontFeature.tabularFigures()],
    );
  }
}
