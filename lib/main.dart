import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_data_taxi_app_task/design_system/components/custom_native_splash.dart';
import 'package:one_data_taxi_app_task/di.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'app/application.dart';

void main() async {
  AndroidYandexMap.useAndroidViewSurface = false;
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  CustomNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await configureDependencies();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarContrastEnforced: false,
    systemNavigationBarColor: Colors.transparent,
    systemStatusBarContrastEnforced: false,
  ));
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).whenComplete(() {
    runApp(const MyApp());
  });
}
