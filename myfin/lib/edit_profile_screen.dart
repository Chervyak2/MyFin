import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfin/bg_widget.dart';
import 'package:myfin/consts/conctc.dart';
import 'package:myfin/custom_textfield.dart';
import 'package:myfin/our_button.dart';
import 'package:myfin/profile_controller.dart';

class EditProfileScreen extends StatelessWidget{
  const EditProfileScreen({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {

    var controller = Get.find<ProfileController>();


    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(
          ()=>Column(

            mainAxisSize: MainAxisSize.min,
            children: [


              controller.profileImgPath.isEmpty 
              ? Image.asset(imgAvatar1, width: 100, fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make() 
              : Image.file(File(controller.profileImgPath.value),
              width: 100,
              fit: BoxFit.cover,
              ).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,

              ourButton(
              color: redColor, 
              onPress: (){
                controller.changeImage(context);
              }, 
              textColor: whiteColor, 
              title: 'Change'),

              Divider(),

              20.heightBox,

              customTextField(
                hint: nameHint,
                title: name,isPass: false),

              customTextField(
                hint: password,
                title: password,isPass: true),
                20.heightBox,

              SizedBox(
              width: context.screenWidth - 60,
              child: ourButton(
              color: redColor, 
              onPress: (){}, 
              textColor: whiteColor, 
              title: 'Save')),
            ],
          )
          .box
          .white
          .padding(EdgeInsets.all(16))
          .margin(EdgeInsets.only(top: 50, left: 12, right: 12))
          .rounded
          .make(),
        ),
      ));
  }
}
