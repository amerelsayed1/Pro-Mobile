import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:unknown/src/core/router/app_router.dart';
import 'package:unknown/src/feature/experts/data/models/appointment_types_model.dart';
import 'package:unknown/src/feature/experts/data/models/availabilities/availabilities_model.dart';
import 'package:unknown/src/feature/experts/presentation/widget/slots_builder.dart';

import '../../../../../../common/widgets/custom_appbar.dart';
import '../../../../../core/state/data_state.dart';
import '../../../data/models/expert_model.dart';
import '../../controllers/home_controller.dart';
import '../../widget/available_builder.dart';

class BookExpertPage extends StatefulWidget {
  final ExpertModel? expert;

  const BookExpertPage({Key? key, required this.expert}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BookExpertState();
}

class _BookExpertState extends State<BookExpertPage> {

  final HomeController _homeController=Get.find<HomeController>();
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _homeController.fetchExpertAppointmentTypes(
      widget.expert?.id??0,
    );

    _homeController.fetchExpertAvailableSlots(
      widget.expert?.id??0,
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        showBackArrow: true,
        title: widget.expert?.nameEn ?? "",
      ),
      body: Obx(() {
        final appointmentList = _homeController.appointmentsState.value;
        switch (appointmentList.status) {
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator());
          case Status.COMPLETED:
            return appointmentListWidget(context,appointmentList.data ?? []);
          case Status.ERROR:
            return Text('Error: ${appointmentList.messages}');
          default:
            return Container();
        }
      }),
    );
  }

  Widget appointmentListWidget(BuildContext context, List<AppointmentTypesModel> data) {
    return AlignedGridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 8,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
            //appRouter.push(const SuccessRoute());
          },
          child: SlotsBuilder(
            appointmentType: data[index],
            isSelected: selectedIndex == index,
          ),
        );
      },
    );
  }

  Widget slotsListWidget(BuildContext context, DataState availabilitiesResponse,
      DataState apiResponse) {
    List<AvailabilitiesModel>? availabilitiesList =
        availabilitiesResponse.data as List<AvailabilitiesModel>?;

    List<AppointmentTypesModel>? appointmentList =
        apiResponse.data as List<AppointmentTypesModel>?;

    switch (availabilitiesResponse.status) {
      case Status.LOADING:
        return const Expanded(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      case Status.COMPLETED:
        return Expanded(
          flex: 10,
          child: Container(
            margin: const EdgeInsetsDirectional.only(
              end: 15,
              start: 15,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: availabilitiesList?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AvailableTimeBuilder(
                          availability: availabilitiesResponse.data?[index],
                          type: appointmentList?[selectedIndex].type ?? "",
                          onClick: (item) {
                            appRouter.push(
                              ConfirmBookingRoute(expert: widget.expert!),
                            );
                          },
                        );
                      }),
                )
              ],
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

  @override
  void dispose() {
    super.dispose();
  }
}
