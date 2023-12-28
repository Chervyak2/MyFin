import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:myfin/applogo_widget.dart';
import 'package:myfin/auth_controller.dart';
import 'package:myfin/bg_widget.dart';
import 'package:myfin/consts/conctc.dart';
import 'package:myfin/custom_textfield.dart';
import 'package:myfin/our_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}):super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>{
  bool? isCheck = false;
  var controller = Get.put(AuthController());


  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            applogoWidget(),
            10.heightBox,
            "Join the $appname".text.fontFamily(bold).white.size(18).make(),
            15.heightBox,
            Column(
              children: [
                customTextField(hint: nameHint, title: name),
                customTextField(hint: emailHint, title: email),
                customTextField(hint: passwordHint, title: password),
                customTextField(hint: passwordHint, title: retypePassword),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {}, child: forgetPassword.text.make())),
                Row(
                  children: [
                    Checkbox(
                      checkColor: redColor,
                      value: false,
                      onChanged: (newValue) {},
                    ),
                    10.heightBox,
                    Expanded(
                      child: RichText(
                          text: const TextSpan(
                        children: [
                          TextSpan(
                              text: "I agree to the ",
                              style: TextStyle(
                                fontFamily: bold,
                                color: fontGrey,
                              )),
                          TextSpan(
                              text: termAndCond,
                              style: TextStyle(
                                fontFamily: bold,
                                color: redColor,
                              )),
                          TextSpan(
                              text: " & ",
                              style: TextStyle(
                                fontFamily: bold,
                                color: fontGrey,
                              )),
                          TextSpan(
                              text: privacyPolicy,
                              style: TextStyle(
                                fontFamily: bold,
                                color: redColor,
                              ))
                        ],
                      )),
                    )
                  ],
                ),
                5.heightBox,
                ourButton(
                        color: redColor,
                        title: login,
                        textColor: whiteColor,
                        onPress: () {})
                    .box
                    .width(context.screenWidth - 50)
                    .make(),
                10.heightBox,
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: alreadyHaveAccount,
                        style: TextStyle(fontFamily: bold, color: fontGrey),
                      ),
                      TextSpan(
                        text: login,
                        style: TextStyle(fontFamily: bold, color: redColor),
                      )
                    ],
                  ),
                ).onTap(() {
                  Get.back();
                })
              ],
            )
                .box
                .white
                .rounded
                .padding(const EdgeInsets.all(16))
                .width(context.screenWidth - 70)
                .shadowSm
                .make()
          ],
        ),
      ),
    ));
  }

}





