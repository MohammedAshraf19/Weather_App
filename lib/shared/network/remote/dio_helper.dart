import 'package:dio/dio.dart';

class DioHelperWeather {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://api.openweathermap.org/data/2.5/',
      receiveDataWhenStatusError: true,
      headers: {'Content-Type': 'application/json', 'lang': 'en'},
    ));
  }

  static Future<Response> getData({
    required String city,
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
  }) async {
    dio.options.headers = {'lang': lang,};
    return await dio.get(
      url,
      queryParameters: {
        "q": city,
        "appid": "f72fa1f168b94d14573920643e562bb1"
      },
    );
  }






  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
  }) async {
    dio.options.headers = {'lang': lang};
    return await dio.post(
      url,
      data: data,
      queryParameters: query,
    );
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
  }) async {
    dio.options.headers = {'lang': lang};
    return await dio.put(
      url,
      data: data,
      queryParameters: query,
    );
  }
}