import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification {
  static FlutterLocalNotificationsPlugin flutterNotificationPlugin;
  static AndroidNotificationDetails androidSettings;

  static Initializer() {
    flutterNotificationPlugin = FlutterLocalNotificationsPlugin();
    androidSettings = AndroidNotificationDetails(
        "111", "Background_task_Channel", "Channel to test background task",
        importance: Importance.High, priority: Priority.Max);
    var androidInitialization = AndroidInitializationSettings('app_icon');
    var initializationSettings =
        InitializationSettings(androidInitialization, null);
    flutterNotificationPlugin.initialize(initializationSettings,
        onSelectNotification: onNotificationSelect);
  }

  static Future<void> onNotificationSelect(String payload) async {
    print(payload);
  }

  static ShowOneTimeNotification(DateTime scheduledDate) async {
    var notificationDetails = NotificationDetails(androidSettings, null);
    await flutterNotificationPlugin.schedule(1, "Background Task notification",
        "Data saved to database", scheduledDate, notificationDetails,
        androidAllowWhileIdle: true);
  }
}
