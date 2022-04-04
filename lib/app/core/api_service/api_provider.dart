import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:getx_prj_base/app/core/api_service/http_client.dart';

import '../../utils/logger.dart';
import 'custom_exception.dart';

abstract class ApiProviderRepository {
  Future<Response<T>> getRequest<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    bool ignoreInvalidToken = false,
  });

  Future<Response<T>> postRequest<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool ignoreInvalidToken = false,
  });

  Future<Response<T>> putRequest<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool ignoreInvalidToken = false,
  });

  Future<Response<T>> deleteRequest<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    bool ignoreInvalidToken = false,
  });
}

class ApiProviderRepositoryImpl implements ApiProviderRepository {
  ApiProviderRepositoryImpl() {
    _dio = HttpClient.getRepository();
  }

  late final Dio _dio;

  @override
  Future<Response<T>> getRequest<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    onReceiveProgress,
    bool ignoreInvalidToken = false,
  }) async {
    try {
      final Response<T> response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options, //buildOptions(options),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioError catch (e) {
      return _catchException(e);
    }
  }

  @override
  Future<Response<T>> postRequest<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    onSendProgress,
    onReceiveProgress,
    bool ignoreInvalidToken = false,
  }) async {
    try {
      final Response<T> response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        //buildOptions(options),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );

      return response;
    } on DioError catch (e) {
      return _catchException(e);
    }
  }

  @override
  Future<Response<T>> deleteRequest<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    bool ignoreInvalidToken = false,
  }) async {
    try {
      final Response<T> response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options, //buildOptions(options),
        cancelToken: cancelToken,
      );
      return response;
    } on DioError catch (e) {
      return _catchException(e);
    }
  }

  @override
  Future<Response<T>> putRequest<T>(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    onSendProgress,
    onReceiveProgress,
    bool ignoreInvalidToken = false,
  }) async {
    try {
      final Response<T> response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        //buildOptions(options),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioError catch (e) {
      return _catchException(e);
    }
  }
}

dynamic getSE(DioError e) {
  if (e.error is SocketException) {
    final errorT = e.error as SocketException;
    if (errorT.osError?.errorCode == 101) {
      // return {
      //   'result': BaseResultModel(
      //     code: '101',
      //     messageVi: AppTranslate.i18n.havingWrongConnectInternetStr.localized,
      //     messageEn: AppTranslate.i18n.havingWrongConnectInternetStr.localized,
      //   ).toJson(),
      //   'data': {},
      // };
    }
  } else if (e.type == DioErrorType.connectTimeout) {
    // final result = {
    //   'code': '102',
    //   'message_vi': AppTranslate.i18n.connectionTimeOutStr.localized,
    //   'message_en': AppTranslate.i18n.connectionTimeOutStr.localized,
    // };
    // return {
    //   'result': result,
    //   'data': null,
    // };
  }
  return null;
}

Response<T> _catchException<T>(DioError dioError) {
  Logger.debug('_catchException $dioError');
  try {
    final se = getSE(dioError);
    if (se != null) {
      return Response(data: se, requestOptions: RequestOptions(path: ''));
    }
  } catch (e) {
    Logger.debug(e.toString());
  }
  switch (dioError.type) {
    case DioErrorType.receiveTimeout:
      throw FetchDataException('receiveTimeout');
    default:
      throw CustomException('-101', 'Unknown Error');
  }
}
