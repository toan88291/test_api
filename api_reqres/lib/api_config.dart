import 'dart:developer' as developer;
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'datasource/api_service.dart';

class ApiConfig{
  static const TAG = 'ApiConfig';
  static const BASE_URL_AUTH = 'https://reqres.in/api/';

  static ApiService getApiService() {
    Dio dioAuth = Dio(
      BaseOptions(
          baseUrl: BASE_URL_AUTH,
          validateStatus: (status) {
            return true;
          }
      ),
    );
    (dioAuth.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dioAuth.interceptors.add(InterceptorsWrapper(onRequest: (requestOptions) {
      developer.log(requestOptions.path);
      if (requestOptions.data != null) {
        developer.log('${requestOptions.data}');
      }
    }, onResponse: (response) {
      developer.log('${response.data}');
      print('${response.data}');
    }));
    return ApiService(dioAuth);
  }
}