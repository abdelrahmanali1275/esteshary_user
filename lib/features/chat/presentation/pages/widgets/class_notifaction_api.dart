import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:luttas/Notifications_chat_screen.dart';
//
// import 'main.dart';

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future notificationsDetails({required String body, required String title, required String payload}) async {
    Person i=Person(name: "saed",);
    Message u=Message("text", DateTime.now(), i);
    var not =  NotificationDetails(
      android: AndroidNotificationDetails(
          'channel id',
          'channel name',
          channelDescription: 'channel description',
          playSound: true,
          priority: Priority.high,
          importance: Importance.max,
          category: AndroidNotificationCategory.call,
          color: Colors.red,
          enableLights: true,
          fullScreenIntent: true,
          subText: "saedf",
          styleInformation: MessagingStyleInformation(i,messages: [u] )
      ),
      iOS: DarwinNotificationDetails(),
    );

    await _notifications.show(0, title, body, not,payload: payload);
  }

  static Future init({bool initSchedule = false}) async {
    const android = AndroidInitializationSettings('@drawable/custom_notification_icon');
    const ios = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,

    );
    const settings = InitializationSettings(android: android, iOS: ios);

    await _notifications.initialize(
      settings,
      onDidReceiveNotificationResponse: (details) {

        // navigatorGlobalKey?.currentState?.push(MaterialPageRoute(
        //   builder: (context) => NotificationsChatScreen(
        //       userId: details.payload??""),
        // ));


      },

      // onDidReceiveNotificationResponse:(payload )async{
      //   _noNotifications.add('');
      // }
    );
  }

// onSelectNotification(payload)async{
//   _noNotifications.add(payload);
// }
}