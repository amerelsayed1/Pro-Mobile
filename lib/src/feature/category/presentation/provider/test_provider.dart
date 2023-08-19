import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unknown/src/feature/category/data/model/category_model.dart';
import 'package:unknown/src/feature/category/presentation/provider/test_notifier.dart';

final profieProvider =
    StateNotifierProvider<ProfileStateNotifier, CategoryModel>(
        (_) => ProfileStateNotifier(CategoryModel()));
