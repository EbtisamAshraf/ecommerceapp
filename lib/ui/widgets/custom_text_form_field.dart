import 'package:flutter/material.dart';


Widget defaultTextFormField({
  var controller ,
  var validator,
  TextInputType? keyboardType,
  var onSaved,
  bool obscure = false,
  ValueChanged<String>? onChanged,
  Widget? suffixIcon,
  String? initVal,


}){

  return TextFormField(
    controller: controller,
    validator: validator,
    keyboardType: keyboardType ,
    onSaved: onSaved,
    obscureText: obscure,
    initialValue: initVal,
    onChanged: onChanged,
    decoration: InputDecoration(
      suffixIcon: suffixIcon,
    ),

  );
}