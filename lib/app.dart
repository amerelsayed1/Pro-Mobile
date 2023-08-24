import 'package:flutter/material.dart';
import 'src/core/router/app_router.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Experts',

      routerConfig: appRouter.config(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
    );
  }


}
