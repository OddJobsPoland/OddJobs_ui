import 'package:jobs_ui/pages/mainIntro.dart';
import 'dart:math';
import 'package:jobs_ui/pages/chats.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.greenAccent,
      systemNavigationBarColor: Colors.greenAccent));
  runApp(MaterialApp(
    home: MyApp(),
    title: 'OddJobs',
    themeMode: ThemeMode.light,
    locale: Locale('pl', 'EU'),
    //debugShowMaterialGrid: true,
    //showPerformanceOverlay: true,
    //checkerboardRasterCacheImages: true,
    //checkerboardOffscreenLayers: true,
    //showSemanticsDebugger: true,
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SignInScreen(providerConfigs: [
              //TwitterProviderConfiguration(apiKey: apiKey, apiSecretKey: apiSecretKey, redirectUri: redirectUri),
              EmailProviderConfiguration(),
              GoogleProviderConfiguration(
                clientId:
                    '852126047148-mgv95rk76cl5ir548uqtn2k3fg60e9mv.apps.googleusercontent.com',
              )
            ]);
          }
          return MainIntro();
        });
  }
}
