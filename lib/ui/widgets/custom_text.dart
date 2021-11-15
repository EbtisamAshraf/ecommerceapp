import 'package:flutter/material.dart';

import '../../constant.dart';


Widget title(String text){

  return Text(text,style: const TextStyle(
    color: black,
    fontSize: 30,
    fontWeight: FontWeight.bold
  ),);
}
Widget subTitle(String text , {TextAlign txtAlign = TextAlign.start}){

  return Text(text,style: const TextStyle(
    color: black,
    fontSize: 14,
  ),
  textAlign: txtAlign,);
}