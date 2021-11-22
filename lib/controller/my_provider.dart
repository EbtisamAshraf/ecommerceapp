import 'package:ecommerceapp/controller/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';



class MyProvider with ChangeNotifier{

 // log in screen
  var unHide = true ;
  showPassword(){
    unHide = !unHide ;
    notifyListeners();
  }


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
  onTapBottomNavigationBar (index){
      selectIndex = index;
      notifyListeners();
  }


  //  home screen
int _current = 0;
  onPageChangedCarousel (index){
    _current = index;
    notifyListeners();
  }


// settings screen
  bool isDark = false ;
  void changeDarkMode (){
    isDark= !isDark;
    SharedPref.saveData(key: 'isDark', value: isDark);
    notifyListeners();
  }


}

