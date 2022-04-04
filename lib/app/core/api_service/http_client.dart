import 'dart:io';
import 'package:dio/dio.dart';

import 'intercepter_logging.dart';

class HttpClient {
  HttpClient._internal();

  static HttpClient shared = HttpClient._internal();

  Dio? _repository;

  static Dio getRepository() {
    shared._repository ??= generateRepository();
    return shared._repository!;
  }

  static Dio generateRepository() => Dio(
        BaseOptions(
            baseUrl: 'base_url',
            connectTimeout: 45000,
            receiveTimeout: 30000,
            responseType: ResponseType.json,
            headers: {
              Headers.contentTypeHeader: 'application/json',
            }),
      )..interceptors.add(AppInterceptorLogging());

  static void setSessionId(String? sessionId) {
    String platform = '';
    if (Platform.isAndroid) {
      platform = 'ANDROID';
    } else if (Platform.isIOS) {
      platform = 'IOS';
    }
    if (shared._repository != null) {
      shared._repository!.options.headers = {
        ...shared._repository!.options.headers,
        'session_id': sessionId ?? '',
        'platform': platform,
      };
    }
  }
}
