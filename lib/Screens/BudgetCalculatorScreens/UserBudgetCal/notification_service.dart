import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificatinService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> intializeNotification() async {
    const AndroidInitializationSettings initializationSettingAndroid =
        AndroidInitializationSettings('flutter-guys-icon');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification(int id , String? title, String? body,String? payLoad) async {
    var dateTime = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, 23, 0, 0);
    tz.initializeTimeZones();
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(dateTime, tz.local),
      NotificationDetails(
        android: AndroidNotificationDetails(
            id.toString(), 'You have Event Today',
            importance: Importance.max, icon: 'flutter-guys-icon'),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  Future scheduleNotification({int id =0 ,String? title,String? body,String? payLoad,required DateTime scheduledNotificationDateTime}) async{
     return flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledNotificationDateTime,
      tz.local,),
      await NotificationDetails(),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime
     );

  }

}
