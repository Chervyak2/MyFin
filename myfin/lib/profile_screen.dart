import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfin/bg_widget.dart';
import 'package:myfin/consts/conctc.dart';
import 'package:myfin/edit_profile_screen.dart';
import 'package:myfin/profile_controller.dart';

class ProfileScreen extends StatelessWidget{
  const  ProfileScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context){

    var controller = Get.put(ProfileController());

    return bgWidget(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [ 
               10.heightBox,
              //edit profile button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Align(alignment: Alignment.topRight, child: Icon(Icons.edit, color: whiteColor)).onTap((){
                Get.to(()=> const EditProfileScreen());
                }),

                ),
              //Users detail info
              Row(
                children: [
                  Image.asset(imgAvatar1, width: 100, fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),
                  10.widthBox,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      'Dummy User'.text.fontFamily(semibold).white.make(),
                      5.heightBox,
                      'custom@example.com'.text.white.make(),
                    ],
                  )),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: whiteColor,
                      )
                    ),
                    onPressed: (){}, 
                    child: logout.text.fontFamily(semibold).make())
                ],
              ),
            ],
          )
        )),
      );
  }
}