// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BookExpertRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BookExpertPage(),
      );
    },
    ExpertDetailsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ExpertDetailsPage(),
      );
    },
    ExpertsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ExpertsPage(),
      );
    },
  };
}

/// generated route for
/// [BookExpertPage]
class BookExpertRoute extends PageRouteInfo<void> {
  const BookExpertRoute({List<PageRouteInfo>? children})
      : super(
          BookExpertRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookExpertRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ExpertDetailsPage]
class ExpertDetailsRoute extends PageRouteInfo<void> {
  const ExpertDetailsRoute({List<PageRouteInfo>? children})
      : super(
          ExpertDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExpertDetailsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ExpertsPage]
class ExpertsRoute extends PageRouteInfo<void> {
  const ExpertsRoute({List<PageRouteInfo>? children})
      : super(
          ExpertsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExpertsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
