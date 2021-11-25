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



}