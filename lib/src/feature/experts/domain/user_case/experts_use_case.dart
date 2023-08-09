import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unknown/src/core/state/test_base_state.dart';
import 'package:unknown/src/feature/experts/data/models/expert_model.dart';
import 'package:unknown/src/feature/experts/domain/repositories/experts_repository.dart';

final expertsUseCaseProvider = Provider(
  (ref) {
    return ExpertsUseCase(
      ref.read(expertsRepositoryProvider),
    );
  },
);

class ExpertsUseCase {
  ExpertsUseCase(this._repository);

  final ExpertsRepository _repository;

  Future<DataState<List<ExpertModel>>> productList() async {
    return await _repository.getExperts();
  }
}
