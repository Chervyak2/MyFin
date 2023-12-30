import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:myfin/applogo_widget.dart';
import 'package:myfin/auth_controller.dart';
import 'package:myfin/bg_widget.dart';
import 'package:myfin/consts/conctc.dart';
import 'package:myfin/custom_textfield.dart';
import 'package:myfin/home.dart';
import 'package:myfin/incomes.dart';

import 'package:myfin/our_button.dart';
import 'package:myfin/homepage.dart';
import 'package:myfin/profile_screen.dart';
import 'new.dart';
import 'expenses.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}):super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>{
  bool? isCheck = false;
  var controller = Get.put(AuthController());

//text controllers
var nameController = TextEditingController();
var emailController = TextEditingController();
var passwordController = TextEditingController();
var passwordRetypeController = TextEditingController();

  void onTabChange(int newIndex) {
    print('Tab changed to index $newIndex');
  }

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
            Obx(() => 
            Column(
              children: [
                customTextField(hint: nameHint, title: name, controller: nameController, isPass: false),
                customTextField(hint: emailHint, title: email, controller: emailController, isPass: false),
                customTextField(hint: passwordHint, title: password, controller: passwordController, isPass: true),
                customTextField(hint: passwordHint, title: retypePassword, controller: passwordRetypeController, isPass: true),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {}, child: forgetPassword.text.make())),
                Row(
                  children: [
                    Checkbox(
                      checkColor: redColor,
                      value: isCheck,
                      onChanged: (newValue) {
                        setState(() {
                          isCheck = newValue;
                        });
                        
                      },
                    ),
                    10.heightBox,
                    Expanded(
                      child: RichText(
                          text: const TextSpan(
                        children: [
                          TextSpan(
                              text: "I agree to the ",
                              style: TextStyle(
                                fontFamily: regular,
                                color: fontGrey,
                              )),
                          TextSpan(
                              text: termAndCond,
                              style: TextStyle(
                                fontFamily: regular,
                                color: redColor,
                              )),
                          TextSpan(
                              text: " & ",
                              style: TextStyle(
                                fontFamily: regular,
                                color: fontGrey,
                              )),
                          TextSpan(
                              text: privacyPolicy,
                              style: TextStyle(
                                fontFamily: regular,
                                color: redColor,
                              ))
                        ],
                      )),
                    )
                  ],
                ),
                5.heightBox,
                
                controller.isloading.value ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor),
                  ) : ourButton(
                        color: isCheck == true ? redColor:lightGrey,
                        title: signup,
                        textColor: whiteColor,
                        
                        onPress: () async{
                          controller.isloading(true);
                          if(isCheck !=false){
                            try {
                              await controller.signupMethod(
                                context: context, 
                                email: emailController.text,
                                password: passwordController.text).then((value) {
                                  return controller.storeUserData(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    name: nameController.text
                                  );
                                }).then((value) {
                                  VxToast.show(context, msg: loggedin);
                                        Get.off(() => HomePage(
                                          onTabChange: (newIndex) => onTabChange(newIndex),
                                          screens: const [
                                            HomeScreen(),
                                            NewScreen(),
                                            ExpensesScreen(),
                                            IncomesScreen(),
                                            ProfileScreen(),
                                            ],
                                            ));
                                });
                            } catch (e) {
                              auth.signOut();
                              VxToast.show(context, msg: e.toString());
                              controller.isloading(false);
                            }
                            
                          }
                        })
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
            ))
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





