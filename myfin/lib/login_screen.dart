import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfin/applogo_widget.dart';
import 'package:myfin/auth_controller.dart';
import 'package:myfin/bg_widget.dart';
import 'package:myfin/consts/conctc.dart';
import 'package:myfin/consts/lists.dart';
import 'package:myfin/custom_textfield.dart';
import 'package:myfin/our_button.dart';
import 'package:myfin/signup_screen.dart';
import 'package:myfin/login_controller.dart';
import 'package:myfin/homepage.dart';
import 'package:myfin/profile_screen.dart';
import 'home.dart';
import 'new.dart';
import 'expenses.dart';
import 'incomes.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController loginController = Get.put(LoginController());

  void onTabChange(int newIndex) {
    print('Tab changed to index $newIndex');
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              applogoWidget(),
              10.heightBox,
              "Log in to $appname".text.fontFamily(bold).white.size(18).make(),
              15.heightBox,
              Obx(()=> Column(
                children: [
                  customTextField(
                    title: 'Email',
                    hint: emailHint,
                    isPass: false,
                  ),
                  customTextField(
                    title: 'Password',
                    hint: passwordHint,
                    isPass: true,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: forgetPassword.text.make(),
                    ),
                  ),
                  5.heightBox,
                  controller.isloading.value 
                  ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor),
                  )
                  : ourButton(
                    color: redColor,
                    title: login,
                    textColor: whiteColor,
                    onPress: () async{
                      controller.isloading(true);

                      await controller.loginMethod(context: context).then((value){
                        if (value != null) {
                          VxToast.show(context, msg: loggedin);
                              Get.off(() => HomePage(
                              onTabChange: (newIndex) => onTabChange(newIndex),
                              screens: const [
                              HomeScreen(),
                              NewScreen(),
                              ExpensesScreen(),
                              IncomesScreen(),
                              ProfileScreen(),],
                        ));
                        } else {
                          controller.isloading(false);
                        }
                      });
                    },
                  ).box.width(context.screenWidth - 50).make(),
                  5.heightBox,
                  createNewAccount.text.color(fontGrey).make(),
                  5.heightBox,
                  ourButton(
                    color: lightGolden,
                    title: signup,
                    textColor: redColor,
                    onPress: () {
                      Get.to(() => const SignupScreen());
                    },
                  ).box.width(context.screenWidth - 50).make(),
                  10.heightBox,
                  loginWith.text.color(fontGrey).make(),
                  5.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => Padding(
                        padding: const EdgeInsets.all(8),
                        child: CircleAvatar(
                          backgroundColor: lightGrey,
                          radius: 25,
                          child: Image.asset(
                            socialIconList[index],
                            width: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
                  .box
                  .white
                  .rounded
                  .padding(const EdgeInsets.all(16))
                  .width(context.screenWidth - 70)
                  .shadowSm
                  .make()
          )],
          ),
        ),
      ),
    );
  }
}
