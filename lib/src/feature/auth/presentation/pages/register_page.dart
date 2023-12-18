import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/custom_appbar.dart';
import '../../../../../common/widgets/custom_snackbar.dart';
import '../../../category/data/model/category_model.dart';
import '../../../category/data/model/specialties_model.dart';
import '../../../experts/presentation/controllers/home_controller.dart';
import '../../data/models/local/register_request.dart';
import '../controller/auth_controller.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameEnController = TextEditingController();
  TextEditingController nameArController = TextEditingController();

  TextEditingController titleEnController = TextEditingController();
  TextEditingController titleArController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController bioEnController = TextEditingController();
  TextEditingController bioArController = TextEditingController();

  CategoryModel? dropdownValue;
  SpecialtiesModel? specialtiesDropdownValue;

  final HomeController _controller = Get.find<HomeController>();
  var selectedValue = 'Option 1'.obs;

  @override
  void initState() {
    super.initState();
    _controller.fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'SignUp',
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
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: nameEnController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name (English)',
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: nameArController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name (Arabic)',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: titleEnController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Title (English)',
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: titleArController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Title (Arabic)',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              controller: emailController,
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
                labelText: 'Password',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 4,
              controller: bioEnController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Bio (English)',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 4,
              controller: bioArController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Bio (Arabic)',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: buildDropdownButton(),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            margin: const EdgeInsetsDirectional.only(top: 10),
            child: ElevatedButton(
              child: const Text('Sign up'),
              onPressed: () {
                _register(Get.find<AuthController>(), context);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Does not have an account?'),
              TextButton(
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  //signup screen
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  String? _getErrorText(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    }
    // Add more validation logic as needed
    return null;
  }

  Widget buildDropdownButton() {
    return Obx(() {
      return DropdownButton<String>(
        value: selectedValue.value,
        items: _controller.categoriesState.value.data?.map((element) {
          return DropdownMenuItem<String>(
            value: element.id?.toString() ?? '0',
            child: Text(element.nameEn ?? ""),
          );
        }).toList() ?? [],
        onChanged: (String? newValue) {
          // Update selected value and fetch data
          selectedValue.value = newValue ?? '';
          // controller.fetchData(newValue ?? '');
        },
      );
    });
  }

  void _register(AuthController authController, BuildContext context) async {
    String nameEn = nameEnController.text.trim();
    String nameAr = nameArController.text.trim();
    String titleEn = titleEnController.text.trim();
    String titleAr = titleArController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String bioEn = bioEnController.text.trim();
    String bioAr = bioArController.text.trim();

    String? nameEnError = _getErrorText(nameEn);
    String? nameArError = _getErrorText(nameAr);
    String? titleEnError = _getErrorText(titleEn);
    String? titleArError = _getErrorText(titleAr);
    String? emailError = _getErrorText(email);
    String? passwordError = _getErrorText(password);
    String? bioEnError = _getErrorText(bioEn);
    String? bioArError = _getErrorText(bioAr);

    if (nameEnError != null) {
      showCustomSnackBar(nameEnError, context);
    } else if (nameArError != null) {
      showCustomSnackBar(nameArError, context);
    } else if (titleEnError != null) {
      showCustomSnackBar(titleEnError, context);
    } else if (titleArError != null) {
      showCustomSnackBar(titleArError, context);
    } else if (emailError != null) {
      showCustomSnackBar(emailError, context);
    } else if (passwordError != null) {
      showCustomSnackBar(passwordError, context);
    } else if (bioEnError != null) {
      showCustomSnackBar(bioEnError, context);
    } else if (bioArError != null) {
      showCustomSnackBar(bioArError, context);
    } else {
      authController.register(
        RegisterRequest(
          email,
          password,
          nameEn,
          nameAr,
          titleEn,
          titleAr,
          bioEn,
          bioAr,
          14,
          [12],
        ),
      );
    }
  }
}
