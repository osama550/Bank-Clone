import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://atmvoice.000webhostapp.com/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String path,
  }) async {
    return await dio!.get(path,);
  }

  static Future<Response> postData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    return await dio!.post(
      path,
      data: data,
    );
  }



}