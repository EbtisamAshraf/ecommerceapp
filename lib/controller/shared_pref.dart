import 'package:shared_preferences/shared_preferences.dart';


class SharedPref {

  static  late SharedPreferences pref;

  static init() async{

       pref = await SharedPreferences.getInstance();
  }

  static dynamic getData({required String key}) async {
    return  pref.get(key);
  }
  static dynamic getDataString({required String key}) async {
    return  pref.getString(key);
  }



  static Future <bool> saveData({required String key , required dynamic value}) async {

    if (value is String) return await pref.setString(key, value);
    if (value is int) return await pref.setInt(key, value);
    if (value is double) return await pref.setDouble(key, value);
    return  await pref.setBool(key, value);

}

  static Future <bool> removeData({required String key}) async{
    return await pref.remove(key);
  }

  static Future <bool> clearAllData() async{
    return await pref.clear();
  }

}