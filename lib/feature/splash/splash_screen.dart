import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:one_data_taxi_app_task/core/constants/app_constants.dart';
import 'package:one_data_taxi_app_task/design_system/components/custom_native_splash.dart';
import 'package:one_data_taxi_app_task/feature/main/presentation/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    CustomNativeSplash.remove();
    _controller = AnimationController(vsync: this);
    Future.delayed(const Duration(seconds: 3), () {
      HomeScreen.open(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          AppConstants.splashLottie,
          width: 300,
          height: 300,
          controller: _controller,
          frameRate: FrameRate.max,
          onLoaded: (composition) {
            _controller.duration = composition.duration * 0.5;
            _controller.repeat();
          },
          fit: BoxFit.cover,
          addRepaintBoundary: true,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
