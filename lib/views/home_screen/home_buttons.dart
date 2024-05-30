import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paws_partners_final/consts/string.dart';
import 'package:velocity_x/velocity_x.dart';

Widget homeButtons ({width, height, icon, String? title, onPress})
{
  return Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Image.asset(icon, width: 300,
    fit: BoxFit.fill,),
  10.heightBox,
    title!.text.color(Colors.black).make(),

  ],
  ).box.rounded.orange50.size(width, height).shadow.make();
}