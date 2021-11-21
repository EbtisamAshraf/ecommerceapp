import 'package:flutter/material.dart';






Color textColor(BuildContext context , bool isDark){
  var color = isDark == false ? Colors.black : Colors.white;
  return color;
}