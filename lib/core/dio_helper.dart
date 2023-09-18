import 'package:dio/dio.dart';
import 'package:tasks_app_errasoft/core/cache_helper.dart';

class DioHelper {
  static late Dio dio;
  static Init_dio() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://tasksapp.integration25.com/api/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData(
      {required String url,
        Map<String, dynamic>? query,
        String? token}) async {

    dio.options.headers = {
      'Authorization': "Bearer $token",
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData(
      {required String url,
        Options ? options,
        Map<String, dynamic>? query,
        required Map<String, dynamic> data,
        String? token}) async {
    dio.options.headers = {
      'Authorization': "Bearer ${CacheHelper.getData(key:'token')}",
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    return await dio.post(url, queryParameters: query, data: data);
  }

  static Future<Response> putData(
      {required String url,
        Map<String, dynamic>? query,
        required Map<String, dynamic> data,
        String? token}) async {
    dio.options.headers = {
      'Authorization': token,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    return await dio.put(url, queryParameters: query, data: data);
  }
}
