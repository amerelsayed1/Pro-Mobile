import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final dioProvider = Provider(
  (ref) {
    return Dio()
      ..interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
        ),
      )
      ..options.baseUrl = "http://192.168.1.10:8080"
      //..options.headers = _headers
      ..options.connectTimeout = const Duration(seconds: 5) // 5 seconds
      ..options.receiveTimeout = const Duration(seconds: 3); // 3 seconds

    /*return Dio(
        BaseOptions(
            connectTimeout: const Duration(milliseconds: 5000),
            receiveTimeout: const Duration(milliseconds: 5000),
            baseUrl: "http://localhost:8080"
        )
    );*/

    //return Dio();
  },
);
