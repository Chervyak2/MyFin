import 'package:flutter/material.dart';
import 'package:myfin/consts/conctc.dart';
import 'package:myfin/splash_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MyFin",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
        fontFamily: regular,
      ),
     home: const SplashScreen(),
    );
  }
}

