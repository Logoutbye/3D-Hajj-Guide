import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hajj_guide/Utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class HajjChecklist extends StatefulWidget {
  @override
  _HajjChecklistState createState() => _HajjChecklistState();
}

class _HajjChecklistState extends State<HajjChecklist> {
  SharedPreferences? prefs;

  List<String> rituals = [
    'Ihram',
    'Tawaf',
    'Sa\'i',
    'Standing at Arafat',
    'Muzdalifah',
    'Stoning of the Devil', 
    'Sacrifice', 
    'Halq or Taqsir', 
    'Tawaf al-Ifadah',
    'Final Tawaf'
  ];

  List<bool> ritualCompleted = List.filled(10, false);

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    initializeNotifications();
    initializeSharedPreferences();
  }

  void initializeSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      ritualCompleted = List.generate(rituals.length, (index) {
        return prefs?.getBool('ritual_$index') ?? false;
      });
    });
  }

  void initializeNotifications() async {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  Future<void> onSelectNotification(String? payload) async {
    // Handle notification tap if needed
    print('Notification tapped. Payload: $payload');
  }

  void scheduleNotification(int index) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.high,
      priority: Priority.high,
    );

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    // Calculate the scheduled time as two minutes from now
    DateTime now = DateTime.now();
    DateTime scheduledTime = now.add(Duration(seconds: 10));

    await flutterLocalNotificationsPlugin.schedule(
      index,
      'Hajj Checklist',
      'It\'s time for ${rituals[index]}!',
      scheduledTime,
      platformChannelSpecifics,
    );
  }
//////////////////////////////////////////////////
  ///this function is for the 2 hours
  // void scheduleNotification(int index, DateTime scheduledTime) async {
  //   tz.initializeTimeZones(); // Initialize the time zone database
  //   String timeZoneName = tz.local.name; // Get the device's current time zone
  //   tz.TZDateTime scheduledDateTime =
  //       tz.TZDateTime.from(scheduledTime, tz.getLocation(timeZoneName));
  //   var androidPlatformChannelSpecifics = AndroidNotificationDetails(
  //     'channel_id',
  //     'channel_name',
  //     importance: Importance.high,
  //     priority: Priority.high,
  //   );
  //   var platformChannelSpecifics = NotificationDetails(
  //     android: androidPlatformChannelSpecifics,
  //   );
  //   await flutterLocalNotificationsPlugin.zonedSchedule(
  //     index,
  //     'Hajj Checklist',
  //     'It\'s time for ${rituals[index]}!',
  //     scheduledDateTime,
  //     platformChannelSpecifics,
  //     androidAllowWhileIdle: true,
  //     uiLocalNotificationDateInterpretation:
  //         UILocalNotificationDateInterpretation.absoluteTime,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.ksecondary,
        foregroundColor: AppColors.kprimary,
        title: Text('Hajj Checklist'),
      ),
      body: ListView.builder(
        itemCount: rituals.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // padding: EdgeInsets.all(8),
              height: MediaQuery.of(context).size.height / 15,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.ksecondary,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: CheckboxListTile(
                title: Text(
                  rituals[index],
                  style: TextStyle(
                      color: AppColors.kprimary, fontWeight: FontWeight.bold),
                ),
                value: ritualCompleted[index],
                onChanged: (value) {
                  setState(() {
                    ritualCompleted[index] = value!;

                    if (index > 0 && !ritualCompleted[index - 1]) {
                      ritualCompleted[index] = false;
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Incomplete Ritual'),
                            content: Text(
                                'Please complete the previous ritual first.'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      prefs?.setBool('ritual_$index', value!);
                      // Schedule notification for the next ritual
                      if (index < rituals.length - 1) {
                        if (value == true) {
                          int estimatedDuration =
                              2; // Estimated duration in hours
                          DateTime nextRitualTime = DateTime.now()
                              .add(Duration(hours: estimatedDuration));
                          // scheduleNotification(index + 1, nextRitualTime);
                          scheduleNotification(index + 1);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  '${rituals[index]} completed. You will be notified for ${rituals[index + 1]} on time'),
                              duration: Duration(
                                  seconds:
                                      3), // Duration for which the SnackBar will be visible
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  '${rituals[index]} is marked as incompleted. Please Complete before performing next rituals.'),
                              duration: Duration(
                                  seconds:
                                      3), // Duration for which the SnackBar will be visible
                            ),
                          );
                        }
                      }
                    }
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
