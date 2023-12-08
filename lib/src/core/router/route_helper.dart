import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unknown/src/feature/auth/presentation/pages/login_page.dart';
import 'package:unknown/src/feature/auth/presentation/pages/register_page.dart';
import 'package:unknown/src/feature/experts/presentation/pages/details/expert_details_page.dart';

import '../../feature/experts/presentation/pages/home/experts_page.dart';

class RouteHelper {
  static const String initial = '/';
  static const String expertDetails = '/expert-details';
  static const String login = "/login-screen";
  static const String signUp = "/signup-screen";

  static const String splash = '/splash';
  static const String language = '/language';
  static const String onBoarding = '/on-boarding';

  static String getInitialRoute() => initial;

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => getRoute(
        const ExpertsPage(),
      ),
    ),
    GetPage(
      name: login,
      page: () => getRoute(
        const LoginPage(),
      ),
    ),GetPage(
      name: signUp,
      page: () => getRoute(
        const RegisterPage(),
      ),
    ),
    GetPage(
      name: expertDetails,
      page: () {
        ExpertDetailsPage expertDetails = Get.arguments;
        return getRoute(expertDetails);
      },
    ),
  ];

  static getRoute(Widget? navigateTo) {
    return navigateTo;
    /* double? minimumVersion = 0;
    if(GetPlatform.isAndroid) {
      minimumVersion = Get.find<SplashController>().configModel!.appMinimumVersionAndroid;
    }else if(GetPlatform.isIOS) {
      minimumVersion = Get.find<SplashController>().configModel!.appMinimumVersionIos;
    }
    return AppConstants.appVersion < minimumVersion! ? const UpdateScreen(isUpdate: true)
        : Get.find<SplashController>().configModel!.maintenanceMode! ? const UpdateScreen(isUpdate: false)
        : Get.find<LocationController>().getUserAddress() != null ? navigateTo
        : AccessLocationScreen(fromSignUp: false, fromHome: false, route: Get.currentRoute);*/
  }
}
