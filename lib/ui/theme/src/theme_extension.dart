import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:scan_me/library/adaptive/adaptive.dart';
import 'package:flutter/material.dart';

import '../../resources/fonts_keys.dart';
import '../app_colors.dart';
import '../app_font_size.dart';
import '../app_theme.dart';

extension ThemeExtension on BuildContext {
  /// Получение текущей темы
  ThemeData get theme => Theme.of(this);

  /// Получение текстовых тем
  TextTheme get textTheme => theme.textTheme;

  /// Системный отступ сверху
  double get systemTopPadding => MediaQuery.of(this).padding.top;

  /// Системный отступ снизу
  double get systemBottomPadding => MediaQuery.of(this).padding.bottom;

  /// Настраиваемый стиль текста
  TextStyle? anyTextStyle({
    Color? color,
    double fontSize = AppFontSize.size14,
    FontWeight fontWeight = FontWeight.w400,
    double height = 1.0,
    double letterSpacing = 1.0,
    TextDecoration? decoration,
    String fontFamily = FontsKeys.natoMedium,
  }) {
    return theme.textTheme.titleSmall?.copyWith(
      fontFamily: fontFamily,
      fontSize: fontSize.a,
      fontWeight: fontWeight,
      color: color,
      height: height,
      decoration: decoration,
      letterSpacing: letterSpacing,
    );
  }

  /// Фигма H1 - Noto Sans size 24, w500, rgba (20, 24, 56, 1)
  TextStyle? white24w500({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
  }) {
    return theme.textTheme.headlineLarge?.copyWith(
      fontSize: fontSize?.a,
      fontWeight: fontWeight,
      color: theme.adaptiveColor(AppColorsLight.white, AppColorsDark.white),
      height: height,
    );
  }

  /// ------- Фигма H2 - три варианта шрифта 18 размера, отличающиеся только цветом. ---------///

  /// Фигма H2 - Noto Sans size 18, w400, rgba (20, 24, 56, 1)
  TextStyle? mBlack18w400({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.headlineLarge?.copyWith(
      fontSize: fontSize?.a ?? 18.a,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color,
    );
  }

  /// -------Фигма H4 - три варианта шрифта 16 размера, отличающиеся только цветом. ---------///

  /// Фигма H4 - Noto Sans size 16, w500, rgba (20, 24, 56, 1)
  TextStyle? mBlack16({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.headlineLarge?.copyWith(
      fontSize: fontSize?.a ?? 16.a,
      fontWeight: fontWeight,
      color: color,
    );
  }

  /// Фигма Subtext - Noto Sans size 12, w500, rgba (145, 147, 167, 1)
  TextStyle? mGray12({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.headlineSmall?.copyWith(
      fontSize: fontSize?.a ?? 12.a,
      fontWeight: fontWeight,
      color: color ?? const Color.fromRGBO(154, 154, 154, 1),
    );
  }
}

extension AppThemeData on ThemeData {
  /// Если isLightThemeMode == dark, вернет forDarkTheme : forLightTheme
  Color adaptiveColor(Color forLightTheme, Color forDarkTheme) {
    return isLightThemeMode ? forLightTheme : forDarkTheme;
  }

  /// Если value == true, вернет trueValueColor : falseValueColor
  Color? valueColor(bool value, Color? trueValueColor, Color? falseValueColor) {
    return value ? trueValueColor : falseValueColor;
  }

  /// Если светлая тема, вернет true
  bool get isLightThemeMode {
    return AppTheme.getResultThemeMode == AdaptiveThemeMode.light;
  }

  /// Прозрачный.
  Color get transparent => Colors.transparent;

  /// Цвет карточки непрочитанной новости.
  Color get unreadNewsColor => isLightThemeMode ? AppColorsLight.gray2 : AppColorsDark.grey1;

  /// Цвет тени.
  Color get shadowCardColor => isLightThemeMode ? AppColorsLight.black2 : AppColorsDark.grey1;
}
