import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_data_taxi_app_task/core/base/base_extensions.dart';
import 'package:one_data_taxi_app_task/core/base/base_functions.dart';
import 'package:one_data_taxi_app_task/design_system/components/bold_start_rich_text.dart';
import 'package:one_data_taxi_app_task/design_system/components/text_view.dart';
import 'package:one_data_taxi_app_task/design_system/ui_extensions.dart';
import 'package:one_data_taxi_app_task/feature/main/presentation/home/bloc/home_bloc.dart';

class LocationInfoCard extends StatelessWidget {
  const LocationInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Positioned(
          right: 10,
          left: 10,
          top: context.statusBarHeight + 10,
          child: Card(
            color: context.themeColors.secondary.withOpacity(0.8),
            shape: RoundedRectangleBorder(borderRadius: getBorderAll12),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BoldEndRichText(
                    startText: 'Bosib o`tilgan yo`l: ',
                    text: _getTotalDistance(state.totalDistance),
                    color: context.themeColors.onSecondary,
                    textSize: 22,
                  ),
                  getHeightSize4,
                  BoldEndRichText(
                    startText: 'Tezlik: ',
                    text: '${state.speed} km/h',
                    textSize: 22,
                    color: context.themeColors.onSecondary,
                  ),
                  getHeightSize6,
                  TextView(
                    text: state.address,
                    textColor: context.themeColors.onSecondary,
                    textSize: 14,
                  ),
                  if (state.isTrackingDistanceEnabled)
                    TextView.boldStyle(
                      text: state.second.formatSecondsToDuration,
                      textSize: 30,
                      textColor: context.themeColors.onSecondary,
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String _getTotalDistance(double total) {
    final convertToKm = total / 1000;
    return '${convertToKm.toStringAsFixed(2)} km';
  }
}
