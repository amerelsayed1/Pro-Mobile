import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../common/widgets/custom_appbar.dart';
import '../../../../../core/router/app_router.dart';
import '../../../../../core/state/data_state.dart';
import '../../../../category/data/model/category_model.dart';
import '../../../data/models/expert_response.dart';
import '../../controllers/home_controller.dart';
import '../../widget/expert_item_builder.dart';
import 'expert_item.dart';

part '../../widget/category_builder.dart';

@RoutePage()
class ExpertsPage extends StatefulWidget {
  const ExpertsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ExpertsState();
}

class _ExpertsState extends State<ExpertsPage> {
  final HomeController _controller = Get.find<HomeController>();

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
                appRouter.push(const LoginRoute());
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
                        categories: categories ?? [],
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
                          return ExpertItemBuilder(experts[index]);
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

  Widget categoriesWidget(BuildContext context, DataState apiResponse) {
    List<CategoryModel>? categoriesList =
        apiResponse.data as List<CategoryModel>?;
    switch (apiResponse.status) {
      case Status.LOADING:
        return const Expanded(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      case Status.COMPLETED:
        return _CategoryBuilder(
          categories: categoriesList ?? [],
        );
      case Status.ERROR:
        return const Center(
          child: Text(
            'Please try again latter!!!',
          ),
        );
      case Status.INITIAL:
      default:
        return const Center(
          child: Text(
            'Search the song by Artist',
          ),
        );
    }
  }

  Widget expertsWidget(BuildContext context, DataState apiResponse) {
    ExpertResponse? experts = apiResponse.data as ExpertResponse?;
    switch (apiResponse.status) {
      case Status.LOADING:
        return const Expanded(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      case Status.COMPLETED:
        return Expanded(
          child: experts?.items?.isNotEmpty == true
              ? GridView.builder(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                    20,
                    10,
                    20,
                    10,
                  ),
                  itemCount: experts?.items?.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 15,
                  ),
                  itemBuilder: (context, position) {
                    return GestureDetector(
                      onTap: () {
                        appRouter.push(
                          ExpertDetailsRoute(expert: experts!.items![position]),
                        );
                      },
                      child: ExpertItemBuilder(
                        experts?.items?[position],
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text(
                    'No Experts in this Category',
                  ),
                ),
        );
      case Status.ERROR:
        return Center(
          child: Text(
            apiResponse.message ?? "",
          ),
        );
      case Status.INITIAL:
      default:
        return const Center(
          child: Text(
            'Search the song by Artist',
          ),
        );
    }
  }
}
