import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myfin/consts/conctc.dart';
import 'package:myfin/splash_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:myfin/consts/firebase_consts.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

   await Firebase.initializeApp(options: FirebaseOptions(apiKey: 'AIzaSyBVd-tkdRZZyHOZTOxROG7CnQmdJiNbOKY', appId: '1:997969505215:android:1cd7dcdcf9f07ae2ff8f0a', messagingSenderId: '', projectId: 'myfin-3fde1'));

  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyFin(),
    );
  }
}

class MyFin extends StatelessWidget{
  const MyFin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: darkFontGrey,
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent),
          fontFamily: regular,
        ),
        home: const SplashScreen(),
      );
  }
}

