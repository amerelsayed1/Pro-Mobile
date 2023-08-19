import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:unknown/src/feature/experts/data/models/expert_model.dart';

import '../../../../../../common/widgets/custom_appbar.dart';
import '../../../../../core/router/routers.dart';
import '../../../../../core/state/test_base_state.dart';
import '../../providers/providers.dart';

class ExpertDetailsPage extends ConsumerStatefulWidget {
  const ExpertDetailsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExpertDetailsState();
}

class _ExpertDetailsState extends ConsumerState<ExpertDetailsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(expertDetailsProvider.notifier).getSingleExpertInfo(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(expertDetailsProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: "Nate Berkus",
      ),
      body: Container(
        padding: const EdgeInsetsDirectional.only(
          start: 10,
          end: 10,
          top: 5,
          bottom: 5,
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: state is LoadingState
                    ? Container()
                    : state is DataSuccess<ExpertModel>
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(
                                height: 320,
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.network(
                                        "https://media.intro.co/avatars/434693o27ZCXhE.jpg",
                                        fit: BoxFit.fill,
                                        height: 170,
                                        width: double.infinity,
                                      ),
                                    )),
                              ),
                              Container(
                                margin: const EdgeInsetsDirectional.symmetric(
                                  vertical: 5,
                                ),
                                child: Text(
                                  state.data?.nameEn ?? "",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                state.data?.titleEn ?? "",
                              ),
                              Visibility(
                                visible: false,
                                child: Container(
                                  height: 35,
                                  margin: const EdgeInsetsDirectional.symmetric(
                                      vertical: 5),
                                  child: Row(
                                    children: [
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics: const ClampingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, position) {
                                          return const Icon(
                                            Icons.star,
                                            color: Colors.orangeAccent,
                                          );
                                        },
                                        itemCount: 5,
                                      ),
                                      Container(
                                        margin: const EdgeInsetsDirectional
                                            .symmetric(horizontal: 5),
                                        child: const Text(
                                          "5.00",
                                          style: TextStyle(
                                            color: Colors.orangeAccent,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      const Text("( 32 )"),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsetsDirectional.only(
                                  top: 10,
                                  bottom: 5,
                                ),
                                child: const Text(
                                  "About me",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                state.data?.bioEn ?? "",
                                style: const TextStyle(height: 1.5),
                              ),
                            ],
                          )
                        : const Center(
                            child: Text(
                              "Check ",
                            ),
                          ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(top: 5),
                        child: const Text(
                          '\$900 . Session',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                        child: Row(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, position) {
                                return const Icon(
                                  Icons.star,
                                  color: Colors.orangeAccent,
                                  size: 15.0,
                                );
                              },
                              itemCount: 5,
                            ),
                            Container(
                              margin: const EdgeInsetsDirectional.only(
                                start: 10,
                                end: 10,
                              ),
                              child: const Text(
                                "5.00",
                                style: TextStyle(
                                  color: Colors.orangeAccent,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            const Text("( 32 )"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    onPressed: () {
                      context.goNamed(
                        Routes.bookExpert.name,
                      );
                    },
                    child: const Text(
                      "See Plans",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
