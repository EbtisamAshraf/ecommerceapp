

import 'package:ecommerceapp/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


Widget defaultButton(String text , {VoidCallback? fun  , double padding = 0.0  }){

  return ElevatedButton(
    onPressed: fun,
    child: Text(text ,style: const TextStyle(fontSize: 14),),style:
  ButtonStyle(
    padding: MaterialStateProperty.all(  EdgeInsets.symmetric(
       vertical: 18 , horizontal:padding )),

      backgroundColor: MaterialStateProperty.all(green)),
    
  );
}


Widget outLineButton(String text , {VoidCallback? fun , String? image , Color clr =black2  }){

  return OutlinedButton.icon(

    onPressed: fun,
    icon: SvgPicture.asset(image! ,alignment: AlignmentDirectional.centerStart,),
    label: Text(text,style: const TextStyle(fontSize: 14,color: black),) ,
    style:  ButtonStyle(
       padding: MaterialStateProperty.all( const EdgeInsets.symmetric(
          vertical: 18, )),

        side: MaterialStateProperty.all(BorderSide(color: clr))

    ),
  );


}