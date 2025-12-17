import 'package:app/gen/fonts.gen.dart';
import 'package:app/ui/theme/font_size.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  factory AppTextTheme() {
    const normalRegular = TextStyle(
      fontWeight: FontWeight.w400,
      height: 1.5,
      leadingDistribution: TextLeadingDistribution.even,
    );
    return AppTextTheme._(
      s10: const TextStyle(fontSize: FontSize.pt10).merge(normalRegular),
      s12: const TextStyle(fontSize: FontSize.pt12).merge(normalRegular),
      s14: const TextStyle(fontSize: FontSize.pt14).merge(normalRegular),
      s16: const TextStyle(fontSize: FontSize.pt16).merge(normalRegular),
      s20: const TextStyle(fontSize: FontSize.pt20).merge(normalRegular),
      s24: const TextStyle(fontSize: FontSize.pt24).merge(normalRegular),
      s32: const TextStyle(fontSize: FontSize.pt32).merge(normalRegular),
      s40: const TextStyle(fontSize: FontSize.pt40).merge(normalRegular),
    );
  }
  const AppTextTheme._({
    required this.s10,
    required this.s12,
    required this.s14,
    required this.s16,
    required this.s20,
    required this.s24,
    required this.s32,
    required this.s40,
  });

  /// Font size 10
  final TextStyle s10;

  /// Font size 12
  final TextStyle s12;

  /// Font size 14
  final TextStyle s14;

  /// Font size 16
  final TextStyle s16;

  /// Font size 20
  final TextStyle s20;

  /// Font size 24
  final TextStyle s24;

  /// Font size 32
  final TextStyle s32;

  /// Font size 40
  final TextStyle s40;
}

extension TextStyleExt on TextStyle {
  TextStyle bold() => copyWith(fontWeight: FontWeight.w700);

  TextStyle semiBold() => copyWith(fontWeight: FontWeight.w600);

  TextStyle medium() => copyWith(fontWeight: FontWeight.w500);

  TextStyle comfort() => copyWith(height: 1.8);

  TextStyle dense() => copyWith(height: 1.2);

  TextStyle rotunda() => copyWith(fontFamily: FontFamily.rotunda);
}

/// Global AppTextTheme instance
final _appTextTheme = AppTextTheme();

/// Extension for easy access to AppTextTheme from BuildContext
extension AppTextThemeExtension on BuildContext {
  /// Get app text theme
  /// Usage: context.appTextTheme.s16
  AppTextTheme get appTextTheme => _appTextTheme;
}
