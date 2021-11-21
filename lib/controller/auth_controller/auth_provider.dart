import 'package:ecommerceapp/controller/shared_pref.dart';
import 'package:ecommerceapp/model/auth_model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';



class MyProvider with ChangeNotifier{

 // log in screen
  var unHide = true ;
  showPassword(){
    unHide = !unHide ;
    notifyListeners();
  }

  // // log in screen
  //  late LogInModel saveDataAfterLogInTrue;
  //
  // showLogInData(value ){
  //   saveDataAfterLogInTrue = value;
  //   return saveDataAfterLogInTrue;
  // }

  String token = 'c';

     String getToken(val){
      token = val ;
      print('token: $token');
      return token;
    }

 // sign up screen
  var countryCode ='+20' ;
  buildCountryCode(value){
    countryCode = value; // make state
    print(countryCode);
    notifyListeners();
  }

 // main screen
  int selectIndex=0;
  onTap (index){
      selectIndex = index;
      notifyListeners();
  }


  //  homescreen
int _current = 0;
  onTapCarousel (index){
    _current = index;
    notifyListeners();
  }

// settings screen
  bool isDark = false ;

  void changeMode (){
    isDark= !isDark;
    SharedPref.saveData(key: 'isDark', value: isDark);
    notifyListeners();
  }


}

