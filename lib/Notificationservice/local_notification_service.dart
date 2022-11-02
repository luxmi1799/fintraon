import 'package:flutter/cupertino.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';

 onDidReceiveLocalNotification (String? id) async {
   print("onSelectNotification");
   if (id!.isNotEmpty) {
     print("Router Value1234 $id");

     // Navigator.of(context).push(
     //   MaterialPageRoute(
     //     builder: (context) => DemoScreen(
     //       id: id,
     //     ),
     //   ),
     // );


   }
 }

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();



  //after this create a method initialize to initialize  localnotification

  static void initialize() {
    // initializationSettings  for Android
    const InitializationSettings initializationSettings =
    InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings()
    );

    _notificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) async {
          print("notificationResponse $notificationResponse");
          // ...
        },
    );
  }


  static void createanddisplaynotification(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "fintracon",
          "pushnotificationappchannel",
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
          sound: RawResourceAndroidNotificationSound('notification.mp3'),
        ),
        iOS: DarwinNotificationDetails(),
      );

      await _notificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data['_id'],
      );

    } on Exception catch (e) {
      print(e);
    }
  }
}