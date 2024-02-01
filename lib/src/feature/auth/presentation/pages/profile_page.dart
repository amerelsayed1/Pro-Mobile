import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unknown/common/widgets/custom_appbar.dart';
import 'package:unknown/src/core/router/route_helper.dart';
import 'package:unknown/src/feature/auth/presentation/controller/auth_controller.dart';

import '../../../experts/presentation/controllers/home_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
      ),
      body: Column(
        children: [
            Center(child: Text(_authController.getUser().email),),
          Center(
            child: TextButton(
              onPressed: () {
                _authController.logout();
                Get.back();
              },
              child: const Text("Logout"),
            ),
          )
        ],
      ),
    );
  }
}
