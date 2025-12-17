import 'package:app/foundation/keys.dart';
import 'package:app/provider/shared_preference_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> _iosSettings() async {
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
}

Future<void> _androidSettings(WidgetRef ref) async {
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  const channel = AndroidNotificationChannel(
    'APP_CHANNEL', // id
    'App Notifications', // title
    description: 'This is a notifications from sample app', // description
    importance: Importance.high,
  );

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  const initializationSettingsAndroid = AndroidInitializationSettings(
    '@drawable/ic_notification',
  );
  const initializationSettingsIOs = DarwinInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
  );
  const initSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOs,
  );

  // Check click notification when app in foreground
  await flutterLocalNotificationsPlugin.initialize(
    initSettings,
    onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) async {
      final payload = notificationResponse.payload;
      debugPrint('FCM: On select notification');
      if (payload != null) {
        debugPrint('FCM: notification payload: $payload');
        // Use for redirect push to specific screen
      }
    },
  );

  // Receive PN when app in foreground
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    debugPrint(
      'FCM: Receive a foreground message ${message.notification?.title}',
    );
    final notification = message.notification;
    final android = message.notification?.android;

    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            // channel.description,
            // ignore: flutter_style_todos
            // TODO add a proper drawable resource to android, for now using
            //      one that already exists in example app.
            icon: '@drawable/ic_notification',
            // The icon should use one color, it will have problem when show with icon use many colors
            color: const Color.fromRGBO(255, 255, 0, 1.0),
          ),
        ),
        payload: notification.body,
      ); // can create a payload with json format and parse when click on push
    }
  });
}

// Receive PN when app in background
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint('FCM: Handling a background message ${message.messageId}');
}

Future<void> fcmSettings(WidgetRef ref) async {
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // For user click on a PN when app in background
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    debugPrint('FCM: A new onMessageOpenedApp ${message.notification?.body}');
  });

  // Receive PN when app not run
  await FirebaseMessaging.instance.getInitialMessage().then((message) async {
    if (message != null) {
      final bodyText = message.notification?.body;
      debugPrint('FCM: Called from terminate status with message $bodyText');
    }
  });

  // Config Android device
  await _androidSettings(ref);

  // Config iOS device
  await _iosSettings();

  // Request permission for show push on iOS device
  final settings = await FirebaseMessaging.instance.requestPermission();
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    debugPrint('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    debugPrint('User granted provisional permission');
  } else {
    debugPrint('User declined or has not accepted permission');
  }
}

Future<void> fetchFCMToken(WidgetRef ref) async {
  await FirebaseMessaging.instance.getToken().then((fcmToken) {
    debugPrint('Called getToken and FCM Token: $fcmToken');
    if (fcmToken != null) {
      debugPrint('Update fcm token');
      final prefs = ref.read(prefsProvider);
      // can not use cascade operator here
      // ignore: cascade_invocations
      prefs.setString(Keys.firebaseToken, fcmToken);
    }
  });

  FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
    debugPrint('Called onTokenRefresh and FCM Token: $fcmToken');
    final prefs = ref.read(prefsProvider);
    // can not use cascade operator here
    // ignore: cascade_invocations
    prefs.setString(Keys.firebaseToken, fcmToken);
  });
}
