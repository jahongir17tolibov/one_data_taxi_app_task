import 'package:flutter/material.dart';
import 'package:one_data_taxi_app_task/core/constants/app_constants.dart';

import 'app_colors.dart';

class MaterialTheme {
  MaterialTheme._();

  static ThemeData get lightTheme => _theme(AppColors.lightScheme);
  static ThemeData get darkTheme => _theme(AppColors.darkScheme);

  static ThemeData _theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
        fontFamily: AppConstants.appFontStyle,
      );
}
