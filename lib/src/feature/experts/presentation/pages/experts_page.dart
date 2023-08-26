import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unknown/common/widgets/custom_appbar.dart';
import 'package:unknown/src/feature/category/data/model/category_model.dart';
import 'package:unknown/src/feature/experts/data/models/expert_response.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/state/data_state.dart';
import '../providers/test_class.dart';
import '../widget/expert_item_builder.dart';

part '../widget/category_builder.dart';

@RoutePage()
class ExpertsPage extends StatefulWidget {
  const ExpertsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ExpertsState();
}

class _ExpertsState extends State<ExpertsPage> {

  @override
  void initState() {
    super.initState();
    Provider.of<TestPattern>(context, listen: false).getCategoriesList().then(
      (value) {
        Provider.of<TestPattern>(context, listen: false).getExperts(
          null,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    DataState<List<CategoryModel>> apiResponse =
        Provider.of<TestPattern>(context).categoriesResponse;
    DataState<ExpertResponse> expertsResponse =
        Provider.of<TestPattern>(context).expertsResponse;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        actionsWidget: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.filter_alt_outlined,
              color: Colors.black,
            ),
          ),
        ],
        showBackArrow: false,
      ),
      body: Column(
        children: [
          /// Categories
          categoriesWidget(context, apiResponse),

          /// Experts
          expertsWidget(context, expertsResponse),
        ],
      ),
    );
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
}
