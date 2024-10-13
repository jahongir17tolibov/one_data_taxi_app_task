import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static ColorScheme get lightScheme => const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFFD87B31),
        onPrimary: Color(0xFF130B03),
        primaryContainer: Color(0xFFE1CBBB),
        onPrimaryContainer: Color(0xFF131210),
        secondary: Color(0xFF1E3C91),
        onSecondary: Color(0xFFE1E8F8),
        error: Color(0xFFB3261E),
        onError: Color(0xFFFFFFFF),
        surface: Color(0xFFFFFCF8),
        onSurface: Color(0xFF151413),
        outline: Color(0xFF7D7467),
      );

  static ColorScheme get darkScheme => const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xFFD87B31),
        onPrimary: Color(0xFF130B03),
        primaryContainer: Color(0xFF5D4C3C),
        onPrimaryContainer: Color(0xFFE1CBBB),
        secondary: Color(0xFF8090D1),
        onSecondary: Color(0xFF182F70),
        error: Color(0xFFF28B82),
        onError: Color(0xFFB3261E),
        surface: Color(0xFF2C2A28),
        onSurface: Color(0xFFFFFCF8),
        outline: Color(0xFF91877C),
      );

  static const Color greyForLines = Color(0xFF8C8A8A);
}
