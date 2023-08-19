import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:unknown/src/core/router/routers.dart';
import 'package:unknown/src/feature/experts/presentation/pages/details/book_expert_page.dart';
import 'package:unknown/src/feature/experts/presentation/pages/experts_page.dart';

import '../../feature/experts/presentation/pages/details/expert_details_page.dart';


final goRouterProvider = Provider((ref) => _router);

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: Routes.expertPage.name,
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const ExpertsPage(),
        );
      },
      routes: [
        GoRoute(
          path: Routes.expertPage.name,
          name: Routes.expertDetails.name,
          pageBuilder: (context, state) {
            return MaterialPage(
              key: state.pageKey,
              child: const ExpertDetailsPage(),
            );
          },
        ),
        GoRoute(
          path: Routes.bookExpert.name,
          name: Routes.bookExpert.name,

          pageBuilder: (context, state) {
            return MaterialPage(
              key: state.pageKey,
              child: const BookExpertPage(),
            );
          },
        ),
      ],
    ),
  ],
);
