import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_data_taxi_app_task/core/constants/app_constants.dart';

class TextView extends StatelessWidget {
  const TextView({
    super.key,
    required this.text,
    this.textSize,
    this.textColor,
    this.textOverflow,
    this.maxLines,
    this.textAlign,
    this.fontWeight,
    this.fontStyle,
    this.textDecorations = const AppTextDecorations(),
    this.letterSpacing,
    this.padding = EdgeInsets.zero,
  });

  const TextView.boldStyle({
    super.key,
    required this.text,
    this.textSize,
    this.textColor,
    this.textOverflow,
    this.maxLines,
    this.textAlign,
    this.textDecorations = const AppTextDecorations(),
    this.letterSpacing,
    this.padding = EdgeInsets.zero,
  })  : fontWeight = FontWeight.bold,
        fontStyle = null;

  final String text;
  final double? textSize;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final Color? textColor;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final AppTextDecorations textDecorations;
  final double? letterSpacing;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          overflow: textOverflow,
          maxLines: maxLines,
          style: _appTextStyle,
          textAlign: textAlign,
        ),
      );

  TextStyle get _appTextStyle => TextStyle(
        fontFamily: AppConstants.appFontStyle,
        fontSize: textSize,
        color: textColor,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        decoration: textDecorations.decoration,
        decorationColor: textDecorations.color,
        letterSpacing: letterSpacing,
      );
}

class AppTextDecorations {
  const AppTextDecorations({this.style, this.decoration, this.color});

  final TextDecorationStyle? style;
  final TextDecoration? decoration;
  final Color? color;
}
