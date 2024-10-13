import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void printOnDebug(Object? msg) {
  debugPrint("------------------\n$msg\n------------------");
}

/// sizedBoxes
SizedBox get getWidthSize4 => const SizedBox(width: 4);
SizedBox get getHeightSize4 => const SizedBox(height: 4);
SizedBox get getWidthSize6 => const SizedBox(width: 6);
SizedBox get getHeightSize6 => const SizedBox(height: 6);
SizedBox get getWidthSize8 => const SizedBox(width: 8);
SizedBox get getHeightSize8 => const SizedBox(height: 8);
SizedBox get getWidthSize10 => const SizedBox(width: 10);
SizedBox get getHeightSize10 => const SizedBox(height: 10);
SizedBox get getWidthSize12 => const SizedBox(width: 12);
SizedBox get getHeightSize12 => const SizedBox(height: 12);
SizedBox get getWidthSize16 => const SizedBox(width: 16);
SizedBox get getHeightSize16 => const SizedBox(height: 16);
SizedBox get getWidthSize20 => const SizedBox(width: 20);
SizedBox get getHeightSize20 => const SizedBox(height: 20);
SizedBox get getWidthSize32 => const SizedBox(width: 32);
SizedBox get getHeightSize32 => const SizedBox(height: 32);
SizedBox getHeightSizeCustom(double size) => SizedBox(height: size);
SizedBox getWidthSizeCustom(double size) => SizedBox(width: size);

/// edgeInsets
EdgeInsets get getPaddingAll4 => const EdgeInsets.all(4);
EdgeInsets get getPaddingAll6 => const EdgeInsets.all(6);
EdgeInsets get getPaddingAll8 => const EdgeInsets.all(8);
EdgeInsets get getPaddingAll10 => const EdgeInsets.all(10);
EdgeInsets get getPaddingAll12 => const EdgeInsets.all(12);
EdgeInsets get getPaddingAll16 => const EdgeInsets.all(16);
EdgeInsets get getPaddingAll20 => const EdgeInsets.all(20);
EdgeInsets get getAuthPadding => const EdgeInsets.fromLTRB(20, 80, 20, 20);
// EdgeInsets get symmetric => const EdgeInsets.symmetric(horizontal: );

/// borders
BorderRadius get getBorderAll8 => BorderRadius.circular(8);
BorderRadius get getBorderAll10 => BorderRadius.circular(10);
BorderRadius get getBorderAll12 => BorderRadius.circular(12);
BorderRadius get getBorderAll14 => BorderRadius.circular(14);
BorderRadius get getBorderAll16 => BorderRadius.circular(16);
BorderRadius get getBorderAll20 => BorderRadius.circular(20);
BorderRadius getCustomBorder(double radius) => BorderRadius.circular(radius);
Radius getCircularRadius(double value) => Radius.circular(value);

/// dividers
Widget get getDivider => const Divider(color: Colors.grey);
Widget get getOpacityDivider => Divider(color: Colors.grey.withOpacity(0.5));

String get getCurrentTime {
  final DateTime now = DateTime.now();
  return DateFormat('HH:mm').format(now);
}
