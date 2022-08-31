import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wasiet/app/Urls.dart';

class NotificationInterceptor {
  static Dio? _dio;
  static ResponseType responseType = ResponseType.json;
  static get token => GetStorage().read('token');

  static Dio? get dio {
    if (_dio == null) {
      _dio = Dio(
        BaseOptions(
          baseUrl: Urls.baseUrl,
          connectTimeout: 15000,
          sendTimeout: 50000,
          receiveTimeout: 50000,
        ),
      );

      _dio!.interceptors.add(
        InterceptorsWrapper(
          onRequest: (
              RequestOptions requestOptions,
              RequestInterceptorHandler handler,
              ) {
            showLoader();
            if (requestOptions.method == 'GET') {
              requestOptions.queryParameters.removeWhere(
                    (key, value) => value == null,
              );
            }
            requestOptions.responseType = responseType;
            requestOptions.headers.addAll({
              HttpHeaders.authorizationHeader: "$token",
              HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded",
            });

            handler.next(requestOptions);
          },
          onResponse: (
              response,
              ResponseInterceptorHandler handler,
              ) {
            //EasyLoading.dismiss();
            //_reestablishDefaultConfig();
            handler.next(response);
          },
          onError: (
              DioError error,
              ErrorInterceptorHandler handler,
              ) {
            EasyLoading.dismiss();
            //_reestablishDefaultConfig();
            //_handleError(error);
            handler.next(error);
          },
        ),
      );
    }

    return _dio;
  }

  /// Loader Setup
  static bool loaderEnabled = true;

  // static get savedToken => null;
  static void showLoader() {
    if (loaderEnabled) EasyLoading.show();
  }

  static void hideLoader() {
    EasyLoading.dismiss();
  }

  static void enableLoader() {
    NotificationInterceptor.loaderEnabled = true;
  }

  static void disableLoader() {
    NotificationInterceptor.loaderEnabled = false;
  }
}