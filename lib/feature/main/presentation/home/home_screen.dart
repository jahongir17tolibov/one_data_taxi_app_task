import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_data_taxi_app_task/core/base/base_extensions.dart';
import 'package:one_data_taxi_app_task/core/service/permission_service.dart';
import 'package:one_data_taxi_app_task/feature/main/presentation/home/widget/location_info_card.dart';
import 'package:one_data_taxi_app_task/feature/main/presentation/home/widget/map_actions_row.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  static Future<void> open(BuildContext context) async {
    await context.navigator.pushReplacementNamed(routeName);
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    PermissionService.requestLocation().whenComplete(() {
      Future.microtask(() => context.read<HomeBloc>().add(OnListenLocationHomeEvent()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Stack(
            children: <Widget>[
              YandexMap(
                mapObjects: state.mapObjects,
                zoomGesturesEnabled: true,
                fastTapEnabled: true,
                scrollGesturesEnabled: true,
                tiltGesturesEnabled: true,
                onMapCreated: (controller) {
                  context.read<HomeBloc>().add(OnMapCreatedHomeEvent(controller));
                },
                onCameraPositionChanged: (position, _, __) {
                  context.read<HomeBloc>().add(OnCameraPositionChangedHomeEvent(position));
                },
              ),
              const LocationInfoCard(),
              const MapActionsRow(),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
