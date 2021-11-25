import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider with ChangeNotifier{

  // log in screen
  var unHide = true ;
  showPassword(){
    unHide = !unHide ;
    notifyListeners();
  }


  String token = 'c';
   getToken(val){
    token = val ;
    // print('token: $token');
    notifyListeners();
  }

  // sign up screen
  var countryCode = '02'  ;
  buildCountryCode(value){
    countryCode = value; // make state
    // print(countryCode);
    notifyListeners();
  }



}
