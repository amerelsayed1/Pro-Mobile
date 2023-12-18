import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unknown/src/feature/experts/presentation/controllers/home_controller.dart';

import '../../../../../../common/images.dart';
import '../../../../../../common/widgets/custom_appbar.dart';
import '../../../../../core/router/app_router.dart';
import '../../../../../core/state/data_state.dart';
import '../../../data/models/expert_model.dart';

class ExpertDetailsPage extends StatefulWidget {
  final ExpertModel expert;

  const ExpertDetailsPage({Key? key, required this.expert}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ExpertDetailsState();
}

class _ExpertDetailsState extends State<ExpertDetailsPage> {
  HomeController _controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    _controller.fetchExpertDetails(widget.expert.id);
  }

  @override
  Widget build(BuildContext context) {
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
        child: Obx(() {
          final expert = _controller.expertDetailsState.value;
          switch (expert.status) {
            case Status.LOADING:
              return const Center(child: CircularProgressIndicator());
            case Status.COMPLETED:
              return getMediaWidget(context, expert.data);
            case Status.ERROR:
              return Text('Error: ${expert.messages}');
            default:
              return Container();
          }
        }),
      ),
    );
  }

  Widget getMediaWidget(BuildContext context, ExpertModel? expert) {
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
                                "https://source.unsplash.com/random/200x200?sig=1",
                            fit: BoxFit.fill,
                            imageErrorBuilder: (context, error, stackTrace) {
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
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    expert?.titleEn ?? "",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsetsDirectional.only(
                      top: 15,
                    ),
                    child: const Text(
                      "About me",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
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
                  Container(
                    margin: const EdgeInsetsDirectional.only(
                      top: 15,
                    ),
                    child: const Text(
                      "What to expect",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsetsDirectional.all(10),
                    margin: const EdgeInsetsDirectional.only(
                      top: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // Adjust the radius as needed
                      color: const Color(0XFFF4F4F4),
                    ),
                    child: const Text(
                      "15 minute session\n- ask three or more questions\n- advice on how to a healthier lifestyle\n- tips and tricks\n- how to eat well",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
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
  }
}
