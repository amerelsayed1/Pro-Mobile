import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:unknown/common/widgets/custom_appbar.dart';
import 'package:unknown/src/core/state/test_base_state.dart';
import 'package:unknown/src/feature/category/data/model/category_model.dart';
import 'package:unknown/src/feature/experts/data/models/expert_model.dart';
import 'package:unknown/src/feature/experts/presentation/providers/providers.dart';

import '../../../../core/router/routers.dart';
import '../../../category/presentation/provider/category_list_provider.dart';
import '../widget/expert_item_builder.dart';

part '../widget/category_builder.dart';

class ExpertsPage extends ConsumerStatefulWidget {
  const ExpertsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ExpertsPage> createState() => _ExpertsState();
}

class _ExpertsState extends ConsumerState<ExpertsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(categoriesProvider.notifier).getCategoriesList();
      ref.read(expertsProvider.notifier).productList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final categoriesState = ref.watch(categoriesProvider);
    final state = ref.watch(expertsProvider);

    log(categoriesState.toString());

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
          categoriesState is LoadingState
              ? Container()
              : categoriesState is DataSuccess<List<CategoryModel>>
                  ? _CategoryBuilder(
                      categories: categoriesState.data ?? [],
                    )
                  : const Center(
                      child: Text(
                        "Check ",
                      ),
                    ),

          /// Experts
          state is LoadingState
              ? const Expanded(
                  child: Center(child: CircularProgressIndicator()))
              : state is DataSuccess<List<ExpertModel>>
                  ? Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                          20,
                          10,
                          20,
                          10,
                        ),
                        itemCount: state.data?.length,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 15,
                        ),
                        itemBuilder: (context, position) {
                          return GestureDetector(
                              onTap: () {
                                context.goNamed(
                                  Routes.expertDetails.name,
                                );
                              },
                              child: ExpertItemBuilder(state.data![position]));
                        },
                      ),
                    )
                  : const Center(
                      child: Text(
                        'Error',
                      ),
                    ),
        ],
      ),
    );
  }
}
