import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_data_taxi_app_task/design_system/components/text_view.dart';
import 'package:one_data_taxi_app_task/di.dart';
import 'package:one_data_taxi_app_task/feature/main/presentation/home/bloc/home_bloc.dart';
import 'package:one_data_taxi_app_task/feature/main/presentation/home/home_screen.dart';
import 'package:one_data_taxi_app_task/feature/splash/splash_screen.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case SplashScreen.routeName:
        return _materialPage(const SplashScreen());

      case HomeScreen.routeName:
        return _materialPage(BlocProvider(
          create: (_) => getIt<HomeBloc>(),
          child: const HomeScreen(),
        ));

      default:
        return _noRoutePage(routeSettings.name);
    }
  }

  static PageRoute _materialPage(Widget screen) => MaterialPageRoute(builder: (_) => screen);

  static PageRoute _cupertinoPage(Widget screen) => CupertinoPageRoute(builder: (_) => screen);

  static PageRoute _noRoutePage(String? routeName) => _materialPage(
        Scaffold(body: Center(child: TextView(text: 'No route defined for $routeName'))),
      );
}
