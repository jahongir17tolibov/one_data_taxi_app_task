import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:one_data_taxi_app_task/core/base/base_functions.dart';
import 'package:one_data_taxi_app_task/design_system/components/text_view.dart';

extension OverlayUi on BuildContext {
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: themeColors.onSurface.withOpacity(0.9),
          duration: const Duration(seconds: 1),
          content: TextView(text: message, textColor: themeColors.surface),
          margin: getPaddingAll8,
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  void showToast(String msg, {Toast? toastLength, ToastGravity? gravity}) {
    Fluttertoast.showToast(
      msg: msg,
      textColor: themeColors.surface,
      backgroundColor: themeColors.onSurface.withOpacity(0.9),
      toastLength: toastLength,
      gravity: gravity,
    );
  }
}

extension ContextExts on BuildContext {
  ColorScheme get themeColors => Theme.of(this).colorScheme;

  double get systemNavigationBarHeight => MediaQuery.of(this).viewPadding.bottom;

  double get statusBarHeight => MediaQuery.of(this).viewPadding.top;
}

extension SizeUtil on num {
  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width * this;

  double screenHeight(BuildContext context) => MediaQuery.of(context).size.height * this;
}
