import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  PushNotification createState() => new PushNotification();
}

class PushNotification {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  @override
  PushNotification() {
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/appicon');
    var iOS = new IOSInitializationSettings();
    var initSettings = new InitializationSettings(android, iOS);
    flutterLocalNotificationsPlugin.initialize(initSettings);
  }

  showNotification(String message) async {
    var android = new AndroidNotificationDetails(
        'channelId', 'channelName', 'channelDescription',
        priority: Priority.High, importance: Importance.Max);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.show(
        0, 'Cowin Reminder', message, platform,
        payload: 'Cowin-flutter-Notification');
  }
}
