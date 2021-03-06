import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../shared_pref.dart';

class SettingsProvider with ChangeNotifier{

 static  SettingsProvider get(context)=>Provider.of(context) ;


  bool isDark = false ;
  bool isDarkMode = false ;
  initDarkMode({bool? isDarkMode}){
    isDarkMode = SharedPref.getBoolData(key:'isDark');
    if (isDarkMode != null){
      isDark = isDarkMode;
    }
    notifyListeners();
      return isDark;
  }
  changeDarkMode (){

      isDark= !isDark;
      SharedPref.saveData(key: 'isDark', value: isDark);
      notifyListeners();

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



