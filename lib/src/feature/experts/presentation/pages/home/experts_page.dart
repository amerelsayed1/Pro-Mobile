import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unknown/src/feature/auth/presentation/controller/auth_controller.dart';

import '../../../../../../common/widgets/custom_appbar.dart';
import '../../../../../core/router/route_helper.dart';
import '../../../../../core/state/data_state.dart';
import '../../../../category/data/model/category_model.dart';
import '../../controllers/home_controller.dart';
import '../../widget/expert_item_builder.dart';
import '../details/expert_details_page.dart';

part '../../widget/category_builder.dart';

@RoutePage()
class ExpertsPage extends StatefulWidget {
  const ExpertsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ExpertsState();
}

class _ExpertsState extends State<ExpertsPage> {
  final HomeController _controller = Get.find<HomeController>();
  bool isLoggedIn = Get.find<AuthController>().isLoggedIn();

  @override
  void initState() {
    super.initState();
    Get.find<HomeController>().fetchMainHomeData(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          actionsWidget: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
            GestureDetector(
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
              ),
              onTap: () {
                if (isLoggedIn) {
                  Get.toNamed(
                    RouteHelper.userProfile,
                  );
                } else {
                  Get.toNamed(
                    RouteHelper.login,
                  );
                }
              },
            ),
          ],
          showBackArrow: false,
        ),
        body: Stack(
          children: [
            Obx(() {
              final categoriesState = _controller.categoriesState.value;
              final expertsState = _controller.expertsState.value;
              return (categoriesState.status == Status.LOADING ||
                      expertsState.status == Status.LOADING)
                  ? const Center(child: CircularProgressIndicator())
                  : const SizedBox.shrink();
            }),
            Expanded(
              child: Obx(() {
                final categoriesState = _controller.categoriesState.value;
                final expertsState = _controller.expertsState.value;

                if (categoriesState.status == Status.ERROR ||
                    expertsState.status == Status.ERROR) {
                  return const Center(child: Text('Failed to load'));
                }

                final categories = categoriesState.data ?? [];
                final experts = expertsState.data?.items ?? [];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      child: _CategoryBuilder(
                        categories: categories,
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          // Adjust the number of columns as needed
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                        itemCount: experts.length,
                        itemBuilder: (context, index) {
                          experts[index].avatarUrl =
                              "https://source.unsplash.com/random/200x200?sig=${index + 1}";
                          return GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                  RouteHelper.expertDetails,
                                  arguments: ExpertDetailsPage(
                                    expert: experts[index],
                                  ),
                                );
                              },
                              child: ExpertItemBuilder(experts[index]));
                        },
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ));
  }
}
