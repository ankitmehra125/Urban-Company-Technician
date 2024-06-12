import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:usc_technician/AUTH/splash_page.dart';
import 'package:usc_technician/DashBoard/BottomNav.dart';
import 'package:usc_technician/DashBoard/Home/Tasks/tasks.dart';
import 'package:usc_technician/Profile/about.dart';
import 'package:usc_technician/Profile/myprofile.dart';
import 'package:usc_technician/Profile/settings.dart';

void main()
{
  // runApp(
  //     DevicePreview(
  //       builder: (context)
  //       {
  //         return MyApp();
  //       },
  //     )
  // );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage()
      // home: BottomNav(),
    );
  }
}


