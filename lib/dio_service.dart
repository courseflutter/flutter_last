import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        headers: {'Content-Type': 'application/json', 'lang': 'en'},
        receiveDataWhenStatusError: true));
  }

  static Future<Response?> postData(
      {required String path,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data}) async {
    return await dio?.post(path, queryParameters: query, data: data);
  }
}
