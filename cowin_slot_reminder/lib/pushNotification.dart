import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';

//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  final String title;
//
//  @override
//  PushNotification createState() => new PushNotification();
//}

class Notification extends StatefulWidget{
  @override
  PushNotification createState() => new PushNotification();
}
class PushNotification extends State<Notification> {

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  PushNotification(){

    var android = new AndroidInitializationSettings('csr_logo_one_round');
    var iOS = new IOSInitializationSettings();
    var initSettings = new InitializationSettings(android, iOS);

    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initSettings, onSelectNotification: onSelectNotification);

  }
  @override
  Widget build(BuildContext context){

  }
  // PushNotification() {
  //   flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
  //   var android = new AndroidInitializationSettings('csr_logo_one');
  //   var iOS = new IOSInitializationSettings();
  //   var initSettings = new InitializationSettings(android, iOS);
  //   flutterLocalNotificationsPlugin.initialize(initSettings);
  // }
  Future onSelectNotification(String payload) {
     showDialog(
      context: context,
      builder: (_) {
        return new AlertDialog(
          title: Text("Your Notification Detail"),
          content: Text("Payload : $payload"),
        );
      },
    );
  }
   showNotification(String message)  {
    var android = new AndroidNotificationDetails(
        'channelId', 'channelName', 'channelDescription',
        priority: Priority.High,
        importance: Importance.Max);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    flutterLocalNotificationsPlugin.show(0,

        'Slot Booking Opened ',
        message,
        platform,
        payload: 'Cowin-flutter-Notification');
  }

}

//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    throw UnimplementedError();
//  }
//
//
//}

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
