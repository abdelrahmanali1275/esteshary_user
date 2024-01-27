import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:naraakom/config/theme/theme_helper.dart';
import 'package:naraakom/core/helper/save_data.dart';
import 'features/chat/presentation/pages/chat_screen.dart';
import 'features/chat/presentation/manager/chat_cubit.dart';
import 'features/chat/presentation/pages/widgets/class_notifaction_api.dart';
import 'features/splash/presentation/pages/splash.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call initializeApp before using other Firebase services.

  print("Handling a background message: ${message.messageId}");
//عملت كومنت هنااااااااااااااااا
  // navigatorGlobalKey?.currentState?.pushAndRemoveUntil(
  //     MaterialPageRoute(
  //       builder: (context) =>
  //           NotificationsChatScreen(userId: message.data["id"] ?? ""),
  //     ),
  //         (route) => false);
}

GlobalKey<NavigatorState>? navigatorGlobalKey = GlobalKey<NavigatorState>();

String? deviceToken;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.initShared();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await NotificationApi.init();

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  deviceToken = await messaging.getToken(
    vapidKey: "BGpdLRs......",
  );
  print("token///////$deviceToken");

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
      print(inChat);

      if (!inChat) {
        NotificationApi.notificationsDetails(
            body: "${message.notification!.body}",
            title: "${message.notification!.title}",
            payload: message.data['id']);
      }
    }
  });
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    navigatorGlobalKey?.currentState?.push(MaterialPageRoute(
      builder: (context) => ChatScreen(userId: event.data["id"] ?? ""),
    ));
  });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  try {
    await messaging.subscribeToTopic('admin');
    print(" subscribeToTopic");
  } catch (e) {
    print("canont subscribeToTopic");
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: MaterialApp(
        navigatorKey: navigatorGlobalKey,
        theme: theme,
        title: 'user استشاري تخاطب',
        debugShowCheckedModeBanner: false,
        locale: const Locale('ar', ''),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('ar', '')],
        home: SplashScreen(),
      ),
    );
  }
}
