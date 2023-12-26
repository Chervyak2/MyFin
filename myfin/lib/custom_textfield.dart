import 'package:myfin/consts/conctc.dart';
import 'package:flutter/material.dart';
Widget customTextField({String? title,String? hint,controller}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(redColor).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
         controller: controller,
        onChanged: (value) {
          print('TextField value changed: $value');
        },
        decoration: InputDecoration(
          hintStyle:TextStyle(
            fontFamily: semibold,
            color: textfieldGrey,
            ),
          hintText: hint,
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: redColor
            )
          )
        )
      ),
      5.heightBox,
    ],
  );

}