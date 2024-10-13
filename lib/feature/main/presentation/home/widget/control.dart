import 'package:flutter/material.dart';
import 'package:one_data_taxi_app_task/design_system/components/text_view.dart';
import 'package:one_data_taxi_app_task/design_system/ui_extensions.dart';

class ControlButton extends StatelessWidget {
  const ControlButton({super.key, required this.onPressed, required this.title});

  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: context.themeColors.primary,
      child: TextView(text: title, textColor: context.themeColors.onPrimary),
    );
  }
}
