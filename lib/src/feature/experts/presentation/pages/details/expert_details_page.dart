import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../common/images.dart';
import '../../../../../../common/widgets/custom_appbar.dart';
import '../../../../../core/router/app_router.dart';
import '../../../../../core/state/data_state.dart';
import '../../../data/models/expert_model.dart';
import '../../controllers/test_class.dart';

@RoutePage()
class ExpertDetailsPage extends StatefulWidget {
  final ExpertModel expert;

  const ExpertDetailsPage({Key? key, required this.expert}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ExpertDetailsState();
}

class _ExpertDetailsState extends State<ExpertDetailsPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<TestPattern>(context, listen: false)
        .getSingleExpertInfo(widget.expert.id);
  }

  @override
  Widget build(BuildContext context) {
    DataState<ExpertModel> apiResponse =
        Provider.of<TestPattern>(context).apiResponse;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        showBackArrow: true,
        title: widget.expert.nameEn ?? "",
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
                              child: FadeInImage.assetNetwork(
                                placeholder: Images.ic_place_holder,
                                image:
                                    "http://192.168.1.12:8080${expert?.avatarUrl ?? ""}",
                                fit: BoxFit.fill,
                                imageErrorBuilder:
                                    (context, error, stackTrace) {
                                  return Image.asset(
                                    Images.ic_place_holder,
                                    fit: BoxFit.fitWidth,
                                  );
                                },
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
                          margin: const EdgeInsetsDirectional.only(top: 5),
                          child: Text(
                            "${expert?.startingPrice?.amount ?? ""} ${expert?.startingPrice?.currency ?? ""} . Session",
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            ),
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
                        appRouter.push(
                          BookExpertRoute(expert: widget.expert),
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
