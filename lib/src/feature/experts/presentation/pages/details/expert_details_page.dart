import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../common/widgets/custom_appbar.dart';
import '../../../../../core/di/locator.dart';
import '../../../../../core/router/app_router.dart';
import '../../../../../core/state/api_response.dart';
import '../../../../../core/state/test_base_state.dart';
import '../../../data/models/expert_model.dart';
import '../../../domain/user_case/single_expert_use_case.dart';
import '../../providers/test_class.dart';

@RoutePage()
class ExpertDetailsPage extends StatefulWidget {
  const ExpertDetailsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ExpertDetailsState();
}

class _ExpertDetailsState extends State<ExpertDetailsPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<TestPattern>(context, listen: false).getSingleExpertInfo(1);
  }

  @override
  Widget build(BuildContext context) {
    DataState<ExpertModel> apiResponse =
        Provider.of<TestPattern>(context).apiResponse;
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
        child: getMediaWidget(context, apiResponse),
      ),
    );
  }

  Widget getMediaWidget(BuildContext context, DataState apiResponse) {
    ExpertModel? expert = apiResponse.data as ExpertModel?;
    switch (apiResponse.status) {
      case Status.LOADING:
        return const Expanded(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      case Status.COMPLETED:
        return Container(
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
                  child: Column(
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
                          expert?.nameEn ?? "",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        expert?.titleEn ?? "",
                      ),
                      const Text(
                        "About me",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsetsDirectional.symmetric(
                          vertical: 5,
                        ),
                        child: Text(
                          expert?.bioEn ?? "",
                          style: const TextStyle(height: 1.5),
                        ),
                      ),
                    ],
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
                        // appRouter.push(BookExpertRoute.page);
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
        );
      case Status.ERROR:
        return const Center(
          child: Text('Please try again latter!!!'),
        );
      case Status.INITIAL:
      default:
        return const Center(
          child: Text('Search the song by Artist'),
        );
    }
  }
}
