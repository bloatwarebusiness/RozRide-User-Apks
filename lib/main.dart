import 'package:flutter/material.dart';
import 'package:nagola/Help/AppColor.dart';
import 'package:nagola/Page/SplashScreen.dart';
void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: AppColor.second,
      debugShowCheckedModeBanner: false,
      title: 'ROZZRIDE',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.light,
      home: SplashScreen(),
    );
  }
}


