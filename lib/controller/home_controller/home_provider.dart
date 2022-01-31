import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider with ChangeNotifier{

  // main screen
  int selectIndex=0;
  onTapBottomNavigationBar (index){
    selectIndex = index;
    notifyListeners();
  }


  //  home screen
  int current = 0;
  onPageChangedCarousel (index){
    current = 5;
    notifyListeners();
  }


}