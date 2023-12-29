import 'package:flutter/material.dart';
import 'package:myfin/bg_widget.dart';
import 'package:myfin/consts/conctc.dart';

class ProfileScreen extends StatelessWidget{
  const  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context){
    return bgWidget(
      child: Scaffold(
        body: SafeArea(child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [ 
              Row(
                children: [
                  Image.asset(imgAvatar1, width: 100, fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make()
                ],
              ),
            ],
          )
        )),
      ),
    );
  }
}