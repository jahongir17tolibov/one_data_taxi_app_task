import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:one_data_taxi_app_task/core/service/permission_service.dart';

class NotificationService {
  NotificationService._();

  static late final FlutterLocalNotificationsPlugin notificationPlugin;
  static NotificationDetails? platformChannelSpecifics;

  static void init() {
    notificationPlugin = FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    notificationPlugin.initialize(initializationSettings);

    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'track_location',
      'track_location_channel',
      channelDescription: 'for_trackong_location_and_timer',
      importance: Importance.max,
      priority: Priority.high,
      ongoing: true,
    );
    platformChannelSpecifics = const NotificationDetails(android: androidPlatformChannelSpecifics);
  }

  static Future<void> showNotification({required String location, String timer = ''}) async {
    const int notificationId = 17;
    final notificationPermissionState = await PermissionService.notificationsPermission();

    if (notificationPermissionState) {
      await notificationPlugin.show(
        notificationId,
        'Location ${timer.isNotEmpty ? 'and kutish vaqti' : ''}',
        '$location\n$timer',
        platformChannelSpecifics,
      );
    }
  }
}
