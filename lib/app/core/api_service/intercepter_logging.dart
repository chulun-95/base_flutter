import 'package:dio/dio.dart';

import '../../utils/logger.dart';

class AppInterceptorLogging extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Logger.info('*** Request ***\nREQUEST[${options.method}] => ${options.uri}', logToFile: true);
    if (options.method == 'POST' || options.method == 'PUT') {
      Logger.info('*** PARAMS ***\n' + options.data.toString(), logToFile: true);
    }
    if (options.method == 'GET') {
      Logger.info('*** PARAMS ***\n' + options.queryParameters.toString(), logToFile: true);
    }
    Logger.info('*** HEADERS ***\n' + options.headers.toString(), logToFile: true);
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Logger.info(
        '*** Response ***\nRESPONSE[${response.statusCode}] => ${response.realUri}\n${response.data.toString()}',
        logToFile: true);
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    Logger.info(
        '*** Error ***\nERROR[${err.response?.data?['code'] ?? err.response?.statusCode}] => ${err.requestOptions.uri} WITH MESSAGE: ${err.response?.data?['message'] ?? err.message}',
        logToFile: true);
    return super.onError(err, handler);
  }
}
