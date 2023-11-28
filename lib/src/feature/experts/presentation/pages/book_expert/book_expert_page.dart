import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:unknown/src/core/router/app_router.dart';
import 'package:unknown/src/feature/experts/data/models/appointment_types_model.dart';
import 'package:unknown/src/feature/experts/data/models/availabilities/availabilities_model.dart';
import 'package:unknown/src/feature/experts/presentation/widget/slots_builder.dart';

import '../../../../../../common/widgets/custom_appbar.dart';
import '../../../../../core/state/data_state.dart';
import '../../../data/models/expert_model.dart';
import '../../providers/test_class.dart';
import '../../widget/available_builder.dart';

@RoutePage()
class BookExpertPage extends StatefulWidget {
  final ExpertModel expert;

  const BookExpertPage({Key? key, required this.expert}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BookExpertState();
}

class _BookExpertState extends State<BookExpertPage> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    Provider.of<TestPattern>(context, listen: false).getExpertAppointment(
      1,
    );
    Provider.of<TestPattern>(context, listen: false).getExpertAvailabilities(
      1,
    );
  }

  @override
  Widget build(BuildContext context) {
    DataState<List<AppointmentTypesModel>> apiResponse =
        Provider.of<TestPattern>(context).appointmentsResponse;

    DataState<List<AvailabilitiesModel>> availabilitiesResponse =
        Provider.of<TestPattern>(context).availabilitiesResponse;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        showBackArrow: true,
        title: widget.expert.titleEn ?? "",
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsetsDirectional.only(
              start: 15,
              top: 10,
            ),
            child: const Text(
              'Book a video call',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(
              start: 15,
              top: 10,
            ),
            child: const Text(
              'Select one of the available time slots below:',
            ),
          ),
          appointmentListWidget(context, apiResponse),
          slotsListWidget(context, availabilitiesResponse, apiResponse),
        ],
      ),
    );
  }

  Widget appointmentListWidget(BuildContext context, DataState apiResponse) {
    List<AppointmentTypesModel>? appointmentList =
        apiResponse.data as List<AppointmentTypesModel>?;
    switch (apiResponse.status) {
      case Status.LOADING:
        return const Expanded(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      case Status.COMPLETED:
        return Expanded(
          child: Container(
            margin: const EdgeInsetsDirectional.only(
              top: 10,
              end: 15,
              start: 15,
            ),
            child: AlignedGridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 8,
              itemCount: appointmentList?.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    //appRouter.push(const SuccessRoute());
                  },
                  child: SlotsBuilder(
                    appointmentType: appointmentList?[index],
                    isSelected: selectedIndex == index,
                  ),
                );
              },
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
                              ConfirmBookingRoute(expert: widget.expert),
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
    Provider.of<TestPattern>(context, listen: false).dispose();
    super.dispose();
  }
}
