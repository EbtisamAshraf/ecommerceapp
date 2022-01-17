

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../shared_pref.dart';

class LangProvider with ChangeNotifier{

  static  LangProvider get(context)=>Provider.of(context) ;


  bool isArabic = false ;
  var lang = Locale('en', 'EN');
  var langApi = 'en';
  changeLang(){
    isArabic = !isArabic;
    if (isArabic == true){
      lang = Locale('ar', 'AR');
      langApi= 'ar';
      SharedPref.saveData(key: 'lang', value: 'ar') ;

    }
    else {
      lang = Locale('en', 'EN');
      langApi= 'en';
      SharedPref.saveData(key: 'lang', value: 'en') ;
         }

    notifyListeners();
    return lang;
  }

}