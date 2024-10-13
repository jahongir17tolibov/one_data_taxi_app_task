import 'package:flutter/material.dart';
import 'package:one_data_taxi_app_task/core/navigation/app_router.dart';
import 'package:one_data_taxi_app_task/design_system/theme/theme.dart';
import 'package:one_data_taxi_app_task/feature/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MaterialTheme.lightTheme,
      darkTheme: MaterialTheme.lightTheme,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: SplashScreen.routeName,
    );
  }
}
