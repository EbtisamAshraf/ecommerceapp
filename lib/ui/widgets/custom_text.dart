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
Widget proText(String text ,Color? color, {TextAlign txtAlign = TextAlign.start}){

  return Text(text,style:  TextStyle(
    color: color,
    fontSize: 14,

  ),
    textAlign: txtAlign,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}

Widget smallText(String text ,Color? color, {TextAlign txtAlign = TextAlign.start}){

  return Text(text,style:  TextStyle(
    color: color,
    fontSize: 12,

  ),
    textAlign: txtAlign,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}
Widget smallGreyText(String text , {TextAlign txtAlign = TextAlign.start}){

  return Text(text,style:  const TextStyle(
    color: Colors.grey,
    fontSize: 12,

  ),
    textAlign: txtAlign,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}
Widget vSmallGreyText(String text , {TextAlign txtAlign = TextAlign.start}){

  return Text(text,style:  const TextStyle(
    color: Colors.grey,
    fontSize: 10,

  ),
    textAlign: txtAlign,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}
