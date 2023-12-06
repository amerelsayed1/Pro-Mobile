import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_appbar.dart';
import '../../../../../common/widgets/custom_snackbar.dart';
import '../../../category/data/model/category_model.dart';
import '../../../category/data/model/specialties_model.dart';
import '../../../experts/presentation/controllers/home_controller.dart';
import '../providers/auth_controller.dart';

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

  final List<SpecialtiesModel> _selected = [];

  @override
  void initState() {
    //Get.find<HomeController>().getCategoriesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        showBackArrow: true,
      ),
      body: GetBuilder<HomeController>(builder: (homeController) {
        return Column(
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
                          obscureText: true,
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
                            labelText: 'password',
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
                      /* Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.4),
                          borderRadius: BorderRadius.circular(
                            4.0,
                          ),
                        ),
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: DropdownButton<CategoryModel>(
                          hint: const Text("Select Category"),
                          items: (homeController.categoriesResponse.data ?? [])
                              .map((CategoryModel item) {
                            return DropdownMenuItem<CategoryModel>(
                              value: item,
                              child: Text(item.nameEn ?? ""),
                            );
                          }).toList(),
                          onChanged: (newVal) {
                            setState(
                              () {
                                dropdownValue = newVal;
                              },
                            );
                            homeController.getSpecialties(
                              dropdownValue?.id ?? 0,
                            );
                          },
                          value: dropdownValue,
                          isExpanded: true,
                          underline: Container(),
                        ),
                      ),*/
                      /*  Align(
                        alignment: Alignment.topLeft,
                        child: Wrap(
                          children: (homeController.specialtiesResponse.data ??
                                  [])
                              .map(
                                (item) => Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: FilterChip(
                                    label: Text(
                                      item.nameEn ?? "",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                    selected: _selected.contains(item),
                                    onSelected: (bool selected) {
                                      setState(() {
                                        if (selected) {
                                          _selected.add(item);
                                        } else {
                                          _selected.removeWhere(
                                              (SpecialtiesModel specialties) {
                                            return specialties == item;
                                          });
                                        }
                                      });
                                    },
                                    backgroundColor: Colors.grey,
                                    selectedColor: Colors.blueAccent,
                                    padding: const EdgeInsets.all(8.0),
                                  ),
                                ),
                              )
                              .toList()
                              .cast<Widget>(),
                        ),
                      ),*/
                      Container(
                          height: 50,
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          margin: const EdgeInsetsDirectional.only(top: 10),
                          child: ElevatedButton(
                            child: const Text('Sign up'),
                            onPressed: () {
                              _register(Get.find<AuthController>(), context);
                            },
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text('Does not have account?'),
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
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  void _register(
    AuthController authController,
    BuildContext context,
  ) async {
    String nameEn = nameEnController.text.trim();
    String nameAr = nameArController.text.trim();
    String titleEn = titleEnController.text.trim();
    String titleAr = titleArController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String bioEn = bioEnController.text.trim();
    String bioAr = bioArController.text.trim();

    if (nameEn.isEmpty) {
      showCustomSnackBar('Enter English Name', context);
    } else if (nameAr.isEmpty) {
      showCustomSnackBar('Enter Arabic Name', context);
    } else if (titleEn.isEmpty) {
      showCustomSnackBar('Enter English Title', context);
    } else if (titleAr.isEmpty) {
      showCustomSnackBar('Enter Arabic Title', context);
    } else if (email.isEmpty) {
      showCustomSnackBar('Enter Email', context);
    } else if (password.isEmpty) {
      showCustomSnackBar('Enter Password', context);
    } else if (bioEn.isEmpty) {
      showCustomSnackBar('Enter English Bio', context);
    } else if (bioAr.isEmpty) {
      showCustomSnackBar('Enter Arabic Bio', context);
    } else {
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
                  SizedBox(height: 15),
                  Text('Loading...')
                ],
              ),
            ),
          );
        },
      );

      /*authController
          .register(
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
      )
          .then(
        (status) async {
          if (status.status == Status.COMPLETED) {
            print("COMPLETED");
          } else {
            print(status.message);
          }
          if (!mounted) return;
          Navigator.of(context).pop();
        },
      );*/
    }
  }
}
