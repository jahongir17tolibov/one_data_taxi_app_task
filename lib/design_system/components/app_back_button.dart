import 'package:flutter/material.dart';
import 'package:one_data_taxi_app_task/core/base/base_extensions.dart';
import 'package:one_data_taxi_app_task/design_system/ui_extensions.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(48),
      onTap: () {
        context.unFocusingKeyboard(() {
          context.navigator.pop();
        });
      },
      child: Icon(Icons.arrow_back_ios_rounded, color: context.themeColors.onSurface),
    );
  }
}
