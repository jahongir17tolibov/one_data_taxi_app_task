import 'package:flutter/material.dart';
import 'package:one_data_taxi_app_task/core/constants/app_constants.dart';

class BoldEndRichText extends StatelessWidget {
  const BoldEndRichText({
    super.key,
    required this.startText,
    required this.text,
    this.color,
    this.textSize,
  });

  final String startText;
  final String text;
  final Color? color;
  final double? textSize;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: startText,
        style: TextStyle(
          fontFamily: AppConstants.appFontStyle,
          color: color,
          fontSize: textSize,
          fontWeight: FontWeight.w400,
        ),
        children: <InlineSpan>[
          TextSpan(
            text: text,
            style: TextStyle(
              fontFamily: AppConstants.appFontStyle,
              color: color,
              fontSize: textSize,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
