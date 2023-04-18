import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static inIt() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://api.aladhan.com/',
        receiveDataWhenStatusError: true,
        // headers: {
        //   'Content-Type': 'application/json',
        //   'Accept': 'application/json',
        // },
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

  // }
}
