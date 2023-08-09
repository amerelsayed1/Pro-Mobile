import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unknown/src/core/state/test_base_state.dart';
import 'package:unknown/src/feature/experts/data/models/expert_model.dart';
import 'package:unknown/src/feature/experts/domain/user_case/experts_use_case.dart';

import 'experts_notifier.dart';

final expertsProvider = StateNotifierProvider<ExpertsNotifier, DataState>(
  (ref) {
    return ExpertsNotifier(
      ref: ref,
      useCase: ref.watch(expertsUseCaseProvider),
    );
  },
);

final expertsDataProvider = Provider<ExpertModel>(
  (ref) => throw UnimplementedError(),
);
