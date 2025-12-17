import 'package:flutter/material.dart';

// Color converter: https://www.w3schools.com/colors/colors_converter.asp
// Transparency list
// 100% FF
// 95%  F2
// 90%  E6
// 87%  DE
// 85%  D9
// 80%  CC
// 75%  BF
// 70%  B3
// 65%  A6
// 60%  99
// 55%  8C
// 54%  8A
// 50%  80
// 45%  73
// 40%  66
// 35%  59
// 32%  52
// 30%  4D
// 26%  42
// 25%  40
// 20%  33
// 16%  29
// 15%  26
// 12%  1F
// 10%  1A
// 5%   0D

/// Color scheme for app theming
class AppColorScheme {
  const AppColorScheme({
    required this.background,
    required this.surface,
    required this.surfaceContainer,
    required this.accent,
    required this.disabled,
    required this.error,
    required this.divider,
    required this.primary,
    required this.icon,
    required this.text,
    required this.textSecondary,
    required this.onSurface,
    required this.outline,
    required this.border,
    required this.gradientStart,
    required this.gradientEnd,
    required this.starColor,
    required this.textOnGradient,
  });

  final Color background;
  final Color surface;
  final Color surfaceContainer;
  final Color accent;
  final Color disabled;
  final Color error;
  final Color divider;
  final Color primary;
  final Color icon;
  final Color text;
  final Color textSecondary;
  final Color onSurface;
  final Color outline;
  final Color border;
  final Color gradientStart;
  final Color gradientEnd;
  final Color starColor;
  final Color textOnGradient;
}

/// Static color utility class supporting Light/Dark mode
class AppColors {
  AppColors._();

  // ============================================
  // Light Mode Color Scheme
  // ============================================
  static const AppColorScheme _lightScheme = AppColorScheme(
    background: Colors.white,
    surface: Color(0xFFF5F5F5),
    surfaceContainer: Color(0xFFECECEC),
    accent: Color(0xFF17C063),
    disabled: Colors.black12,
    error: Color(0xFFFF7466),
    divider: Color(0xFFE0E0E0),
    primary: Color(0xFF17C06C),
    icon: Color(0xFF94A1A9),
    text: Color(0xFF212121),
    textSecondary: Color(0xFF757575),
    onSurface: Color(0xFF1C1B1F),
    outline: Color(0xFF79747E),
    border: Color(0xFFD0D6DA),
    gradientStart: Color(0xFF00CBCF),
    gradientEnd: Color(0xFF007AD9),
    starColor: Color(0xFFFFA000),
    textOnGradient: Colors.white,
  );

  // ============================================
  // Dark Mode Color Scheme
  // ============================================
  static const AppColorScheme _darkScheme = AppColorScheme(
    background: Color(0xFF121212),
    surface: Color(0xFF1E1E1E),
    surfaceContainer: Color(0xFF2D2D2D),
    accent: Color(0xFF17C063),
    disabled: Colors.white12,
    error: Color(0xFFFF5544),
    divider: Color(0xFF424242),
    primary: Color(0xFF17C06C),
    icon: Color(0xFF94A1A9),
    text: Color(0xFFE0E0E0),
    textSecondary: Color(0xFF9E9E9E),
    onSurface: Color(0xFFE6E1E5),
    outline: Color(0xFF938F99),
    border: Color(0xFF424242),
    gradientStart: Color(0xFF00CBCF),
    gradientEnd: Color(0xFF007AD9),
    starColor: Color(0xFFFFA000),
    textOnGradient: Colors.white,
  );

  // ============================================
  // Public accessors
  // ============================================

  /// Get light mode color scheme
  static AppColorScheme get light => _lightScheme;

  /// Get dark mode color scheme
  static AppColorScheme get dark => _darkScheme;

  /// Get color scheme based on current theme brightness
  /// Usage: AppColors.of(context).primary
  static AppColorScheme of(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark ? _darkScheme : _lightScheme;
  }

  /// Get color scheme based on ThemeMode
  /// Usage: AppColors.fromMode(ThemeMode.dark)
  static AppColorScheme fromMode(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.dark:
        return _darkScheme;
      case ThemeMode.light:
      case ThemeMode.system:
        return _lightScheme;
    }
  }
}

/// Extension for easy access to AppColors from BuildContext
extension AppColorsExtension on BuildContext {
  /// Get current theme's color scheme
  /// Usage: context.appColors.primary
  AppColorScheme get appColors => AppColors.of(this);

  /// Check if current theme is dark mode
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
