import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:unknown/src/feature/experts/presentation/pages/experts_page.dart';

import '../../feature/experts/data/models/expert_model.dart';
import '../../feature/experts/presentation/pages/details/book_expert_page.dart';
import '../../feature/experts/presentation/pages/details/expert_details_page.dart';

/*@AdaptiveAutoRouter(
  routes: [
    AutoRoute(page: ExpertsPage, initial: true),
  ],
)*/

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: ExpertsRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: ExpertDetailsRoute.page,
        ),
        AutoRoute(
          page: BookExpertRoute.page,
        )
      ];
}

final appRouter = AppRouter();
