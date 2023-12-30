import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfin/auth_controller.dart';
import 'package:myfin/bg_widget.dart';
import 'package:myfin/consts/conctc.dart';
import 'package:myfin/edit_profile_screen.dart';
import 'package:myfin/firestore_services.dart';
import 'package:myfin/login_screen.dart';
import 'package:myfin/profile_controller.dart';

class ProfileScreen extends StatelessWidget{
  const  ProfileScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context){

    var controller = Get.put(ProfileController());

    return bgWidget(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirestoreServices.getUser(currentUser!.uid), 
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(!snapshot.hasData){
              return const Center(
                child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
                ),
              );
            }
            else{

              var data = snapshot.data!.docs[0];

              return SafeArea(
                child: Column(
                  children: [ 
                    10.heightBox,
              //edit profile button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Align(alignment: Alignment.topRight, child: Icon(Icons.edit, color: whiteColor)).onTap((){
                      controller.nameController.text = data['name'];
                      controller.passController.text = data['password'];
                Get.to(()=> EditProfileScreen(data: data));
                }),
                ),


              //Users detail info
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  data['imageUrl'] == '' ?
                  Image.asset(imgAvatar1, width: 100, fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make()
                  :
                  Image.network(data['imageUrl'], width: 100, fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),
                  10.widthBox,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      '${data['name']}'.text.fontFamily(semibold).white.make(),
                      5.heightBox,
                      '${data['email']}'.text.white.make(),
                    ],
                  )),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: whiteColor,
                      )),
                    onPressed: ()async{
                      await Get.put(AuthController()).signoutMethod(context);
                      Get.offAll(() => LoginScreen());
                    }, 
                    child: logout.text.fontFamily(semibold).white.make()
                    )],
              ),
              )],
          )
        );}
        })
        ),
      );
  }
}