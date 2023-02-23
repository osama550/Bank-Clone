import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static SharedPreferences? sheredPrefrences;

  static init() async{
    sheredPrefrences = await SharedPreferences.getInstance();
  }

  static Future<bool> putBoolean({
    required String key,
    required bool value,
}) async{
    return await sheredPrefrences!.setBool(key, value);
  }


  static bool? getBoolean(
  {
  required String key
}){
    return sheredPrefrences!.getBool(key);
  }

}