import 'package:flutter/material.dart';
import 'package:scan_me/library/adaptive/adaptive.dart';

/// Отступы приложения
abstract class AppPadding {
  /// Основной горизонтальный отступ приложения.
  static double mainWidth = 28.0;
  static double padding20 = 20.0;

  static EdgeInsets widthPadding = EdgeInsets.symmetric(horizontal: mainWidth.a);
}
