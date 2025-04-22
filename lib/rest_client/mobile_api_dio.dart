// TODO Implement this library.
import 'package:dio/dio.dart';

class MobileApiDio {
  static late MobileApiDio _instance;
  late Dio _http;

  static get instance {
    _instance = MobileApiDio._internal();
    return _instance;
  }

  MobileApiDio._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      connectTimeout: Duration(seconds: 5000),
      receiveTimeout: Duration(seconds: 5000),
      sendTimeout: Duration(seconds: 5000),
      contentType: 'application/x-www-form-urlencoded',
    );

    _http = Dio(options);
  }

  factory MobileApiDio() => MobileApiDio._internal();

  get client => _http;

  dispose() {
    _http.close();
  }
}
