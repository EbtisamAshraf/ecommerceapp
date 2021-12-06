import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

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
      // SharedPref.saveData(key: 'token', value: 'ar') ; or  saveLocale: true,
    }
    else {
      lang = Locale('en', 'EN');
      langApi= 'en';
    }

    notifyListeners();
    return lang;
  }


  File? imageFile;
  var base64Image;
  /// Get from gallery
  getFromGallery() async {
    PickedFile? pickedFile = (await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxHeight:1800
        ,maxWidth: 1800 )) as PickedFile?;
    if (pickedFile != null) {
        imageFile = File(pickedFile.path);
        List<int> imageBytes = imageFile!.readAsBytesSync();
        base64Image = base64Encode(imageBytes);

    }
    notifyListeners();
  }

  /// Get from Camera
  getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
        imageFile = File(pickedFile.path);
        List<int> imageBytes = imageFile!.readAsBytesSync();
        base64Image = base64Encode(imageBytes);
    }
    notifyListeners();
  }

}