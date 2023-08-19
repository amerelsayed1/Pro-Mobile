import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/rest_client.dart';
import 'experts_data_source_imp.dart';

final expertsDataSourceProvider = Provider<ExpertsDataSource>(
  (ref) => ExpertsDataSourceImpl(
    client: ref.watch(
      dioProvider,
    ),
  ),
);

abstract class ExpertsDataSource {
  Future<Response> getExperts();
  Future<Response> getSingleExpertInfo(int id);
}
