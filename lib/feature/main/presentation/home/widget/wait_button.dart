import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_data_taxi_app_task/core/base/base_functions.dart';
import 'package:one_data_taxi_app_task/design_system/components/app_button.dart';
import 'package:one_data_taxi_app_task/design_system/components/scale_on_press_button.dart';
import 'package:one_data_taxi_app_task/design_system/ui_extensions.dart';
import 'package:one_data_taxi_app_task/feature/main/presentation/home/bloc/home_bloc.dart';

class WaitButton extends StatelessWidget {
  const WaitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, bool>(
      selector: (state) => state.isTrackingDistanceEnabled,
      builder: (context, isEnabled) {
        return Expanded(
          child: ScaleOnPress(
            child: Padding(
              padding: getPaddingAll6,
              child: AppButton(
                onPressed: () {
                  context.read<HomeBloc>().add(OnPressTrackingDistanceHomeEvent());
                },
                text: isEnabled ? 'To`xtatish' : 'Kutish',
                buttonColor: isEnabled ? context.themeColors.error : context.themeColors.primary,
                textColor: isEnabled ? context.themeColors.onError : context.themeColors.onPrimary,
                buttonWidth: 0.25.screenWidth(context),
              ),
            ),
          ),
        );
      },
    );
  }
}
