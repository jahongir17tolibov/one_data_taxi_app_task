import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_data_taxi_app_task/core/base/base_functions.dart';
import 'package:one_data_taxi_app_task/design_system/components/app_button.dart';
import 'package:one_data_taxi_app_task/design_system/components/scale_on_press_button.dart';
import 'package:one_data_taxi_app_task/design_system/ui_extensions.dart';
import 'package:one_data_taxi_app_task/feature/main/presentation/home/bloc/home_bloc.dart';

// class WaitButton extends StatefulWidget {
//   const WaitButton({super.key});
//
//   @override
//   State<WaitButton> createState() => _WaitButtonState();
// }
//
// class _WaitButtonState extends State<WaitButton> with SingleTickerProviderStateMixin {
//   late final AnimationController _animationController;
//   late final Animation<Offset> _offsetAnimation;
//
//   @override
//   void initState() {
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 400),
//     );
//
//     _offsetAnimation = Tween<Offset>(
//       begin: const Offset(-1.0, 0.0),
//       end: Offset.zero,
//     ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeIn));
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocSelector<HomeBloc, HomeState, bool>(
//       selector: (state) => state.isTrackingDistance,
//       builder: (context, isTrackingDistance) {
//         return AnimatedSwitcher(
//           duration: const Duration(milliseconds: 400),
//           child: isTrackingDistance
//               ? Expanded(
//                   flex: 1,
//                   child: SlideTransition(
//                     position: _offsetAnimation,
//                     child: AppButton(
//                       onPressed: () {},
//                       text: 'Kutish',
//                       buttonColor: context.themeColors.secondary.withOpacity(0.9),
//                       textColor: context.themeColors.onSecondary,
//                     ),
//                   ),
//                 )
//               : const SizedBox.shrink(),
//         );
//       },
//     );
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
// }

class PauseButton extends StatelessWidget {
  const PauseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return state.isTrackingDistanceEnabled
            ? Expanded(
                child: Padding(
                  padding: getPaddingAll6,
                  child: ScaleOnPress(
                    child: AppButton(
                      onPressed: () {
                        context.read<HomeBloc>().add(OnPressWaitHomeEvent());
                      },
                      text: state.isPaused ? 'Davom ettirish' : 'Pause',
                      buttonWidth: 0.25.screenWidth(context),
                      buttonColor: context.themeColors.secondary.withOpacity(0.9),
                      textColor: context.themeColors.onSecondary,
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
