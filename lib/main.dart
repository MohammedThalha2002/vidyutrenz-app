import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:vidyutrenz_app/controller/unseen_msg_controller.dart';
import 'package:vidyutrenz_app/pages/events.dart';
import 'package:vidyutrenz_app/pages/homepage.dart';
import 'package:vidyutrenz_app/pages/proclaims.dart';
import 'package:vidyutrenz_app/pages/welcome_page.dart';

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey(debugLabel: "Main Navigator");

late String routeToGo = '/';
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
String? payload;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("APP IS ON THE BACKGROUND");
  routeToGo = '/second';
  print(message.notification!.body);
  Get.to(
    Proclaims(),
    transition: Transition.fadeIn,
    duration: Duration(milliseconds: 800),
  );
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // titletion
  importance: Importance.high,
  playSound: true,
);

Future<void> selectNotification(String? payload) async {
  if (payload != null) {
    debugPrint('notification payload: $payload');
    UnseenMsgController unseenMsgController = Get.put(UnseenMsgController());
    Get.to(
      Proclaims(),
      transition: Transition.fadeIn,
      duration: Duration(milliseconds: 800),
    );
    // navigatorKey.currentState?.pushNamed('/second');
  }
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Notification control for the background -- when app is running
  //initialize background
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // assign channel (required after android 8)
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  // initialize notification for android
  var initialzationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettings =
      InitializationSettings(android: initialzationSettingsAndroid);
  flutterLocalNotificationsPlugin.initialize(initializationSettings);

  final NotificationAppLaunchDetails? notificationAppLaunchDetails =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

  print('payload=');
  payload = notificationAppLaunchDetails!.payload;
  if (payload != null) {
    routeToGo = '/second';
    Get.to(
      Proclaims(),
      transition: Transition.fadeIn,
      duration: Duration(milliseconds: 800),
    );
    // navigatorKey.currentState?.pushNamed('/second');
  }

  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: selectNotification);
  // When msg is opened
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    print(message.notification!.body);
    if (message.notification!.body != null) {
      print("When message is opened on background");
      Get.to(
        Proclaims(),
        transition: Transition.fadeIn,
        duration: Duration(milliseconds: 800),
      );
      // navigatorKey.currentState?.pushNamed('/second');
    }
  });

  //Do this in main.dart
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String token;
  getToken() async {
    token = (await FirebaseMessaging.instance.getToken())!;
    print(token);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Notification control for the foreground -- when app is running
    // check foreground notification
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(message.notification!.body);
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        print("APP IS ON THE FOREGROUND");
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                icon: android.smallIcon,
              ),
            ));
      }
    });
    getToken();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Vidyutrenz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: const Routes(),
    );
  }
}

// Page routes
class Routes extends StatefulWidget {
  const Routes({Key? key}) : super(key: key);

  @override
  State<Routes> createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          print(routeToGo);
          if (routeToGo == '/second') {
            Get.to(Proclaims());
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          return HomePage();
        } else {
          return WelcomePage();
        }
      }),
    );
  }
}
