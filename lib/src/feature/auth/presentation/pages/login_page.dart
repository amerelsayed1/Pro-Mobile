import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unknown/src/core/router/app_router.dart';
import 'package:unknown/src/core/state/data_state.dart';
import 'package:unknown/src/feature/auth/data/models/local/login_request.dart';

import '../../../../../common/widgets/custom_appbar.dart';
import '../providers/auth_controller.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //late AuthProvider authProvider;

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    //authProvider = Provider.of<AuthProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        showBackArrow: true,
      ),
      body: GetBuilder<AuthController>(builder: (authController) {
        return Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Sign in',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'To enjoy all of our cool features ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email Address',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'password',
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        margin: const EdgeInsetsDirectional.only(top: 10),
                        child: ElevatedButton(
                          child: const Text('Sign in'),
                          onPressed: () {
                            _login(authController);

                            /* Get.find<AuthController>().login(
                                LoginRequest(
                                  "amer@expertarena.app",
                                  "amer",
                                ),
                              );*/

                            //authProvider.
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsetsDirectional.only(
                          top: 15,
                          bottom: 15,
                        ),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              appRouter.push(const RegisterRoute());
                            },
                            child: const Text.rich(
                              TextSpan(
                                text: 'Do not have account ',
                                children: [
                                  TextSpan(
                                    text: 'Sign up',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  void _login(
    AuthController authController,
  ) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return const Dialog(
          backgroundColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // The loading indicator
                CircularProgressIndicator(),
                SizedBox(
                  height: 15,
                ),
                Text('Loading...')
              ],
            ),
          ),
        );
      },
    );

    authController.login(LoginRequest("user@pro.com", "123456")).then(
      (status) async {
        if (status.status == Status.COMPLETED) {
          print("COMPLETED");
          if (!mounted) return;
          Navigator.of(context).pop();
        } else {
          print("No");
        }
      },
    );
  }
}
