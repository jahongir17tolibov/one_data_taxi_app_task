import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_data_taxi_app_task/core/base/base_functions.dart';
import 'package:one_data_taxi_app_task/core/service/permission_service.dart';
import 'package:one_data_taxi_app_task/design_system/ui_extensions.dart';
import 'package:one_data_taxi_app_task/feature/main/presentation/home/bloc/home_bloc.dart';

class MyCurrentLocationButton extends StatelessWidget {
  const MyCurrentLocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: IconButton.filledTonal(
        onPressed: () async {
          final isGranted = await PermissionService.requestLocation();
          if (isGranted) {
            if (!context.mounted) return;
            context.read<HomeBloc>().add(OnLocateCurrentPositionHomeEvent());
          }
        },
        style: IconButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: getBorderAll12)),
        color: context.themeColors.secondary.withOpacity(0.8),
        icon: Icon(Icons.my_location_rounded, color: context.themeColors.onSecondary),
      ),
    );
  }
}
