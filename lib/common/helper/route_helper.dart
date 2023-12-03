import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../src/feature/experts/presentation/pages/home/experts_page.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String language = '/language';
  static const String onBoarding = '/on-boarding';

  static String getInitialRoute() => initial;

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => getRoute(const ExpertsPage())),
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
