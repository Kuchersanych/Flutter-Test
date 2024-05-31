import 'package:flutter/material.dart';
import 'package:scan_me/di/app_factory.dart';

/// Точка входа в приложение.
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(makeAppFactory.makeApp());
}
