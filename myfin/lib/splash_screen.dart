import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:myfin/applogo_widget.dart';
import 'package:myfin/consts/conctc.dart';
import 'package:myfin/login_screen.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({Key? key}): super(key:key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{

  //creating a method to change screen
  changeScreen(){
    Future.delayed(Duration(seconds: 3),(){
      Get.to(() => LoginScreen());
    }
    );
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
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
            Spacer(),
            credits.text.white.fontFamily(semibold).make(),
            30.heightBox,

          ],
        ),
      ),

    );
  }
}
