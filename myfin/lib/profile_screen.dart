import 'package:flutter/material.dart';
import 'package:myfin/bg_widget.dart';
import 'package:myfin/consts/conctc.dart';

class ProfileScreen extends StatelessWidget{
  const  ProfileScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context){
    return bgWidget(
      child: Scaffold(
        body: SafeArea(
          child: Container(
          padding: EdgeInsets.all(16),


          child: Column(
            children: [ 
              //edit profile button

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
                Align(
                alignment: Alignment.topRight,
                child: const Icon(Icons.edit, color: whiteColor)).onTap(() { }),
              
            ],
          )
        )),
      ),
    );
  }
}