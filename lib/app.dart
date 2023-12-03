import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/helper/route_helper.dart';
import 'common/util/constants.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Constants.appName,
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,
      /* scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
      ),*/
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      /*locale: localizeController.locale,
      translations: Messages(languages: languages),
      fallbackLocale: Locale(AppConstants.languages[0].languageCode ?? 'ar',
          AppConstants.languages[0].countryCode),
      initialRoute: GetPlatform.isWeb
          ? RouteHelper.getInitialRoute()
          : RouteHelper.getSplashRoute(body, linkBody),*/
      getPages: RouteHelper.routes,
      defaultTransition: Transition.topLevel,
      transitionDuration: const Duration(milliseconds: 500),
    );

    /* return MaterialApp.router(
      title: 'Experts',

      routerConfig: appRouter.config(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
    );*/
  }
}
