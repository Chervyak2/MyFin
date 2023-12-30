import 'dart:io';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfin/bg_widget.dart';
import 'package:myfin/consts/conctc.dart';
import 'package:myfin/custom_textfield.dart';
import 'package:myfin/our_button.dart';
import 'package:myfin/profile_controller.dart';


class EditProfileScreen extends StatelessWidget{
  final dynamic data;

  const EditProfileScreen({Key? key, this.data}):super(key: key);



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

//еif data img url & controller is empty apply standart avater
              data['imageUrl'] == '' && controller.profileImgPath.isEmpty 
              ? Image.asset(imgAvatar1, width: 100, fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make() 
              //if data is not empty but controller path is empty
              : data['imageUrl'] != '' && controller.profileImgPath.isEmpty
              ? Image.network(data['imageUrl'],
              width: 100,
              fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make()
              
              //cont is not empty but data image url is
              :Image.file(File(controller.profileImgPath.value),
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
                controller: controller.nameController,
                hint: nameHint,
                title: name,isPass: false),

              customTextField(
                controller: controller.passController,
                hint: password,
                title: password,isPass: true),

                20.heightBox,

              controller.isloading.value ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
              ) : SizedBox(
              width: context.screenWidth - 60,
              child: ourButton(
              color: redColor, 
              onPress: () async{
                controller.isloading(true);
                await controller.uploadProfileImage();
                await controller.updateProfile(controller.nameController.text, 
                controller.passController.text, 
                controller.profileImgLink.text);
                VxToast.show(context, msg: 'Updated');
              }, 
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
