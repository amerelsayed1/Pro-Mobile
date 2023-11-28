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
      final args = routeData.argsAs<BookExpertRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BookExpertPage(
          key: args.key,
          expert: args.expert,
        ),
      );
    },
    ConfirmBookingRoute.name: (routeData) {
      final args = routeData.argsAs<ConfirmBookingRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ConfirmBookingPage(
          key: args.key,
          expert: args.expert,
        ),
      );
    },
    ExpertDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ExpertDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ExpertDetailsPage(
          key: args.key,
          expert: args.expert,
        ),
      );
    },
    ExpertsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ExpertsPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterPage(),
      );
    },
    SuccessRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SuccessPage(),
      );
    },
  };
}

/// generated route for
/// [BookExpertPage]
class BookExpertRoute extends PageRouteInfo<BookExpertRouteArgs> {
  BookExpertRoute({
    Key? key,
    required ExpertModel expert,
    List<PageRouteInfo>? children,
  }) : super(
          BookExpertRoute.name,
          args: BookExpertRouteArgs(
            key: key,
            expert: expert,
          ),
          initialChildren: children,
        );

  static const String name = 'BookExpertRoute';

  static const PageInfo<BookExpertRouteArgs> page =
      PageInfo<BookExpertRouteArgs>(name);
}

class BookExpertRouteArgs {
  const BookExpertRouteArgs({
    this.key,
    required this.expert,
  });

  final Key? key;

  final ExpertModel expert;

  @override
  String toString() {
    return 'BookExpertRouteArgs{key: $key, expert: $expert}';
  }
}

/// generated route for
/// [ConfirmBookingPage]
class ConfirmBookingRoute extends PageRouteInfo<ConfirmBookingRouteArgs> {
  ConfirmBookingRoute({
    Key? key,
    required ExpertModel expert,
    List<PageRouteInfo>? children,
  }) : super(
          ConfirmBookingRoute.name,
          args: ConfirmBookingRouteArgs(
            key: key,
            expert: expert,
          ),
          initialChildren: children,
        );

  static const String name = 'ConfirmBookingRoute';

  static const PageInfo<ConfirmBookingRouteArgs> page =
      PageInfo<ConfirmBookingRouteArgs>(name);
}

class ConfirmBookingRouteArgs {
  const ConfirmBookingRouteArgs({
    this.key,
    required this.expert,
  });

  final Key? key;

  final ExpertModel expert;

  @override
  String toString() {
    return 'ConfirmBookingRouteArgs{key: $key, expert: $expert}';
  }
}

/// generated route for
/// [ExpertDetailsPage]
class ExpertDetailsRoute extends PageRouteInfo<ExpertDetailsRouteArgs> {
  ExpertDetailsRoute({
    Key? key,
    required ExpertModel expert,
    List<PageRouteInfo>? children,
  }) : super(
          ExpertDetailsRoute.name,
          args: ExpertDetailsRouteArgs(
            key: key,
            expert: expert,
          ),
          initialChildren: children,
        );

  static const String name = 'ExpertDetailsRoute';

  static const PageInfo<ExpertDetailsRouteArgs> page =
      PageInfo<ExpertDetailsRouteArgs>(name);
}

class ExpertDetailsRouteArgs {
  const ExpertDetailsRouteArgs({
    this.key,
    required this.expert,
  });

  final Key? key;

  final ExpertModel expert;

  @override
  String toString() {
    return 'ExpertDetailsRouteArgs{key: $key, expert: $expert}';
  }
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

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SuccessPage]
class SuccessRoute extends PageRouteInfo<void> {
  const SuccessRoute({List<PageRouteInfo>? children})
      : super(
          SuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'SuccessRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
