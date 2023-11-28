import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import 'category_data_source.dart';

class CategoryDataSourceImpl implements CategoryDataSource {
  CategoryDataSourceImpl({
    required this.client,
  });

  final Dio client;

  @override
  Future<Response> categories() async {
    (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =(HttpClient dioClient) {
      dioClient.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };


    final response = await client.get(
      '/v1/categories',
    );
    return response;
  }

  @override
  Future<Response> specialties(int id) async {
    final response = await client.get(
      '/catalog/v1/specialties?categoryId=$id',
    );
    return response;
  }
}
