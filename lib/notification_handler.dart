import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
  log("${message.from}: ${message.category} : ${message.notification}");
  log("BACKGROUND DATA ${message.data}");
  if (message.data != null) {
    log("====hey");
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    Map<String, dynamic> pinpointMessage = message.data;
    if (flutterLocalNotificationsPlugin == null) {
      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    }
    if (pinpointMessage["pinpoint.notification.imageUrl"] != null &&
        pinpointMessage["pinpoint.notification.imageIconUrl"] != null) {
      log("h2");
      return NotificationHandler().showBigPictureNotification(pinpointMessage);
    } else if (pinpointMessage["pinpoint.notification.imageUrl"] != null) {
      return NotificationHandler()
          .showBigPictureNotificationHiddenLargeIcon(pinpointMessage);
    } else
      flutterLocalNotificationsPlugin.show(
          pinpointMessage["pinpoint.campaign.campaign_id"].hashCode,
          pinpointMessage["pinpoint.notification.title"],
          pinpointMessage["pinpoint.notification.body"],
          NotificationDetails(
            android: AndroidNotificationDetails(
              'high_importance_channel', // id
              'High Importance Notifications', // title
              'This channel is used for important notifications.', // description
              importance: Importance.high,
              icon: null, // android?.smallIcon,
              // other properties...
            ),
          ));
  }
}

class NotificationHandler {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late AndroidNotificationChannel channel;
  NotificationHandler() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    // if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      'This channel is used for important notifications.', // description
      importance: Importance.high,
    );
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    getToken();
  }
  Future<void> getToken() async {
    var token = await FirebaseMessaging.instance.getToken();
    log("$token");
  }

  Future<void> firebaseMessagingForegroundHandler(RemoteMessage message) {
    Map<String, dynamic> pinpointMessage = message.data;
    if (pinpointMessage["pinpoint.notification.imageUrl"] != null &&
        pinpointMessage["pinpoint.notification.imageIconUrl"] != null) {
      log("h2");
      return showBigPictureNotification(pinpointMessage);
    } else if (pinpointMessage["pinpoint.notification.imageUrl"] != null) {
      return showBigPictureNotificationHiddenLargeIcon(pinpointMessage);
    } else
      return flutterLocalNotificationsPlugin.show(
          pinpointMessage["pinpoint.campaign.campaign_id"].hashCode,
          pinpointMessage["pinpoint.notification.title"],
          pinpointMessage["pinpoint.notification.body"],
          NotificationDetails(
            android: AndroidNotificationDetails(
              'high_importance_channel', // id
              'High Importance Notifications', // title
              'This channel is used for important notifications.', // description
              importance: Importance.high,
              icon: null,
            ),
          ));
  }

  Future<void> showBigPictureNotification(
      Map<String, dynamic> pinpointMessage) async {
    final String largeIconPath = await _downloadAndSaveFile(
        pinpointMessage["pinpoint.notification.imageIconUrl"], 'largeIcon');
    final String bigPicturePath = await _downloadAndSaveFile(
        pinpointMessage["pinpoint.notification.imageUrl"], 'bigPicture');
    final BigPictureStyleInformation bigPictureStyleInformation =
        BigPictureStyleInformation(FilePathAndroidBitmap(bigPicturePath),
            largeIcon: FilePathAndroidBitmap(largeIconPath),
            contentTitle: '<b>${pinpointMessage["pinpoint.notification.title"]}</b>',
            htmlFormatContentTitle: true,
            summaryText: '${pinpointMessage["pinpoint.notification.body"]}',
            htmlFormatSummaryText: true);
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('big text channel id',
            'big text channel name', 'big text channel description',
            styleInformation: bigPictureStyleInformation);
    final NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        pinpointMessage["pinpoint.campaign.campaign_id"].hashCode,
        pinpointMessage["pinpoint.notification.title"],
        pinpointMessage["pinpoint.notification.body"],
        platformChannelSpecifics);
  }

  Future<void> showBigPictureNotificationHiddenLargeIcon(
      Map<String, dynamic> pinpointMessage) async {
    final String bigPicturePath = await _downloadAndSaveFile(
        pinpointMessage["pinpoint.notification.imageUrl"], 'bigPicture');
    final BigPictureStyleInformation bigPictureStyleInformation =
        BigPictureStyleInformation(FilePathAndroidBitmap(bigPicturePath),
            hideExpandedLargeIcon: true,
            contentTitle: '<b>${pinpointMessage["pinpoint.notification.title"]}</b>',
            htmlFormatContentTitle: true,
            summaryText: '${pinpointMessage["pinpoint.notification.body"]}',
            htmlFormatSummaryText: true);
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('big text channel id',
            'big text channel name', 'big text channel description',
            styleInformation: bigPictureStyleInformation);
    final NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        pinpointMessage["pinpoint.campaign.campaign_id"].hashCode,
        pinpointMessage["pinpoint.notification.title"],
        pinpointMessage["pinpoint.notification.body"],
        platformChannelSpecifics);
  }

  Future<String> _downloadAndSaveFile(String url, String fileName) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/$fileName';
    final http.Response response = await http.get(Uri.parse(url));
    final File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }
}
