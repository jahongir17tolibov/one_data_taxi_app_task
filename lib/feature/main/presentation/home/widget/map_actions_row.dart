import 'package:flutter/material.dart';
import 'package:one_data_taxi_app_task/design_system/ui_extensions.dart';
import 'package:one_data_taxi_app_task/feature/main/presentation/home/widget/my_current_location_button.dart';
import 'package:one_data_taxi_app_task/feature/main/presentation/home/widget/pause_button.dart';
import 'package:one_data_taxi_app_task/feature/main/presentation/home/widget/wait_button.dart';

class MapActionsRow extends StatelessWidget {
  const MapActionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10,
      left: 10,
      bottom: context.systemNavigationBarHeight,
      child: const Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          WaitButton(),
          PauseButton(),
          MyCurrentLocationButton(),
        ],
      ),
    );
  }
}
