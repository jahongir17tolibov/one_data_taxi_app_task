import 'dart:async';

import 'package:location/location.dart' as l;
import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  PermissionService._();

  static Future<bool> requestLocation() async {
    final l.Location location = l.Location();
    bool serviceEnabled;
    PermissionStatus locationPerm;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      await location.requestService();
    }

    locationPerm = await Permission.location.status;
    if (locationPerm.isDenied) {
      await Permission.location.request();
    }

    return serviceEnabled && locationPerm.isGranted;
  }

  static Future<bool> notificationsPermission() async {
    bool isGranted;

    isGranted = await Permission.notification.isGranted;
    if (!isGranted) {
      await Permission.notification.request();
    }

    return isGranted;
  }
}
