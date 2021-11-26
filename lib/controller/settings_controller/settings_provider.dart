import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../shared_pref.dart';

class SettingsProvider with ChangeNotifier{

  bool isDark = false ;
  changeDarkMode ({bool? isDarkMode}){
    if (isDarkMode != null){
      isDark = isDarkMode;
    } else{
      isDark= !isDark;
      SharedPref.saveData(key: 'isDark', value: isDark);
      notifyListeners();
    }
    // print('isDark: $isDark');



  }


  bool isArabic = false ;
  var lang = Locale('en', 'EN');
  var langApi = 'en';
  changeLang(){
    isArabic = !isArabic;
    if (isArabic == true){
      lang = Locale('ar', 'AR');
      langApi= 'ar';
    }
    else {
      lang = Locale('en', 'EN');
      langApi= 'en';
    }

    notifyListeners();
    return lang;
  }



}