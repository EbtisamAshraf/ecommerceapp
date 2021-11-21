import 'package:ecommerceapp/controller/auth_controller/auth_provider.dart';
import 'package:ecommerceapp/controller/fun.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';

Widget title(String text, Color? color ){

  return Text(text,style:  TextStyle(
    color: color,
    fontSize: 30,
    fontWeight: FontWeight.bold
  ),);
}
Widget midTitle(String text , Color? color){

  return Text(text,style:  TextStyle(
    color: color,
    fontSize: 26,
    fontWeight: FontWeight.w500
  ),);
}
Widget subTitle(String text ,Color? color, {TextAlign txtAlign = TextAlign.start}){

  return Text(text,style:  TextStyle(
    color: color,
    fontSize: 14,
  ),
  textAlign: txtAlign,);
}
Widget midText(String text , Color? color ,{TextAlign txtAlign = TextAlign.start}){

  return Text(text,style:  TextStyle(
    color: color,
    fontSize: 18,
  ),
  textAlign: txtAlign,);
}
Widget largeText(String text , Color? color ,{TextAlign txtAlign = TextAlign.start}){

  return Text(text,style:  TextStyle(
    color: color,
    fontSize: 22,
  ),
  textAlign: txtAlign,
  overflow: TextOverflow.ellipsis,
    maxLines: 1,
  );
}

