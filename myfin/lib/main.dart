import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myfin/consts/conctc.dart';
import 'package:myfin/splash_screen.dart';
import 'home.dart';
import 'new.dart';
import 'expenses.dart';
import 'incomes.dart';
import 'homepage.dart';
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
      //home: HomePage(
        //onTabChange: (index) {
          // Здесь вы можете обработать изменение индекса
          //if (kDebugMode) {
            //print('Tab changed to index $index');
         //}
       // },
        //screens: const [
          //HomeScreen(),
         // NewScreen(),
          //ExpensesScreen(),
          //IncomesScreen(),
        //],
     // ),
     home: const SplashScreen(),
    );
  }
}

