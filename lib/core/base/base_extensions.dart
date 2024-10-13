import 'package:flutter/cupertino.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

extension StringExtensions on String {
  bool get phoneNumbIsValid {
    final RegExp regex = RegExp(r'^\+998\d{9}$');
    return regex.hasMatch(this);
  }

  String get capitalize => isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : '';
}

extension BuildContextExtensions on BuildContext {
  NavigatorState get navigator => Navigator.of(this);

  void unFocusingKeyboard(VoidCallback callBack) {
    final FocusScopeNode focusScope = FocusScope.of(this);
    if (!focusScope.hasPrimaryFocus) focusScope.unfocus();
    callBack.call();
  }

  Future<bool> get getConnectivity => InternetConnectionChecker().hasConnection;
}

extension RestTimeOnDuration on Duration {
  int get inDaysRest => inDays;
  int get inHoursRest => inHours - (inDays * 24);
  int get inMinutesRest => inMinutes - (inHours * 60);
  int get inSecondsRest => inSeconds - (inMinutes * 60);
  int get inMillisecondsRest => inMilliseconds - (inSeconds * 1000);
  int get inMicrosecondsRest => inMicroseconds - (inMilliseconds * 1000);
}

extension IntExtens on int {
  String get formatSecondsToDuration {
    final Duration duration = Duration(seconds: this);
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final secs = (duration.inSeconds % 60).toString().padLeft(2, '0');

    return '$hours:$minutes:$secs';
  }
}
