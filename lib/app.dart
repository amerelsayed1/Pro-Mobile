import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/util/constants.dart';
import 'src/core/router/route_helper.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Constants.appName,
      debugShowCheckedModeBanner: false,

      navigatorKey: Get.key,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      themeMode: ThemeMode.light,
      getPages: RouteHelper.routes,
      defaultTransition: Transition.topLevel,
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}
