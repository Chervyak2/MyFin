import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:myfin/applogo_widget.dart';
import 'package:myfin/consts/conctc.dart';
import 'package:myfin/login_screen.dart';
import 'home.dart';
import 'new.dart';
import 'expenses.dart';
import 'incomes.dart';
import 'package:myfin/homepage.dart';
import 'package:myfin/profile_screen.dart';
class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{

  //creating a method to change screen
  changeScreen(){
    Future.delayed(const Duration(seconds: 3),(){
      //Get.to(() => LoginScreen());

      auth.authStateChanges().listen((User? user) {
        if(user == null && mounted){
          Get.to(()=>LoginScreen());
        }else{
          Get.off(() => HomePage(
            onTabChange: (newIndex) => onTabChange(newIndex),
            screens: const [
              HomeScreen(),
              NewScreen(),
              ExpensesScreen(),
              IncomesScreen(),
              ProfileScreen()
            ],
          ));
        }
       });
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  void onTabChange(int newIndex) {
    print('Tab changed to index $newIndex');
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:  redColor,
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(icSplashBg, width: 300)),
            20.heightBox,
            applogoWidget(),
            10.heightBox,
            appname.text.fontFamily(bold).size(22).white.make(),
            5.heightBox,
            appversion.text.white.make(),
            const Spacer(),
            credits.text.white.fontFamily(semibold).make(),
            30.heightBox,

          ],
        ),
      ),

    );
  }
}
