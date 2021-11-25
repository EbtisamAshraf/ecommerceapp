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
  int _current = 0;
  onPageChangedCarousel (index){
    _current = index;
    notifyListeners();
  }


}