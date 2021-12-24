import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget title(String text, Color? color ){

  return Text(text.tr().toString(),style:  TextStyle(
    color: color,
    fontSize: 30,
    fontWeight: FontWeight.bold
  ),);
}
Widget midTitle(String text , Color? color){

  return Text(text.tr().toString(),style:  TextStyle(
    color: color,
    fontSize: 26,
    fontWeight: FontWeight.w500
  ),);
}
Widget subTitle(String text ,Color? color, {TextAlign txtAlign = TextAlign.start}){

  return Text(text.tr().toString(),style:  TextStyle(
    color: color,
    fontSize: 14,

  ),
  textAlign: txtAlign,);
}
Widget detailsText(String text ,Color? color, {TextAlign txtAlign = TextAlign.start}){

  return Text(text.tr().toString(),style:  TextStyle(
    color: color,
    fontSize: 14,
    height: 2
  ),
  textAlign: txtAlign,);
}
Widget detailsTextL(String text ,Color? color, {TextAlign txtAlign = TextAlign.start}){

  return Text(text.tr().toString(),style:  TextStyle(
    color: color,
    fontSize: 16,
    height: 2
  ),
  textAlign: txtAlign,);
}
Widget midText(String text , Color? color ,{TextAlign txtAlign = TextAlign.start}){

  return Text(text.tr().toString(),style:  TextStyle(
    color: color,
    fontSize: 18,
  ),
  textAlign: txtAlign,
  maxLines: 2,
  overflow: TextOverflow.ellipsis,);
}
Widget largeText(String text , Color? color ,{TextAlign txtAlign = TextAlign.start}){

  return Text(text.tr().toString(),style:  TextStyle(
    color: color,
    fontSize: 22,
  ),
  textAlign: txtAlign,
  overflow: TextOverflow.ellipsis,
    maxLines: 1,
  );
}
Widget proText(String text ,Color? color, {TextAlign txtAlign = TextAlign.start}){

  return Text(text.tr().toString(),style:  TextStyle(
    color: color,
    fontSize: 14,

  ),
    textAlign: txtAlign,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}
Widget smallText(String text ,Color? color, {TextAlign txtAlign = TextAlign.start}){

  return Text(text.tr().toString(),style:  TextStyle(
    color: color,
    fontSize: 12,

  ),
    textAlign: txtAlign,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}
Widget smallGreyText(String text , {TextAlign txtAlign = TextAlign.start}){

  return Text(text.tr().toString(),style:  const TextStyle(
    color: Colors.grey,
    fontSize: 12,

  ),
    textAlign: txtAlign,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}
Widget vSmallGreyText(String text , {TextAlign txtAlign = TextAlign.start}){

  return Text(text.tr().toString(),style:  const TextStyle(
    color: Colors.grey,
    fontSize: 10,

  ),
    textAlign: txtAlign,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}
