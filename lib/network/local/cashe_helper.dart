import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static SharedPreferences? sheredPrefrences;

  static init() async{
    sheredPrefrences = await SharedPreferences.getInstance();
  }

  static Future<bool> putBoolean({
    required bool value,
}) async{
    return await sheredPrefrences!.setBool('isSpeak', value);
  }


  static bool? getBoolean(){
    return sheredPrefrences!.getBool('isSpeak');
  }

}