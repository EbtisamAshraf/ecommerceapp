import 'package:flutter/material.dart';


Widget defaultTextFormField({
  var controller ,
  var validator,
  TextInputType? keyboardType,
  var onSaved,
  bool obscure = false,
  ValueChanged<String>? onChanged,
  Widget? suffixIcon,


}){

  return TextFormField(
    controller: controller,
    validator: validator,
    keyboardType: keyboardType ,
    onSaved: onSaved,
    obscureText: obscure,
    onChanged: onChanged,
    decoration: InputDecoration(
      suffixIcon: suffixIcon,
    ),

  );
}