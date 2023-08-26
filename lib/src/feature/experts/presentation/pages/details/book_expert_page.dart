import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:unknown/src/feature/experts/data/models/appointment_types_model.dart';
import 'package:unknown/src/feature/experts/data/models/availabilities/availabilities_model.dart';
import 'package:unknown/src/feature/experts/presentation/pages/status/success_page.dart';
import 'package:unknown/src/feature/experts/presentation/widget/slots_builder.dart';

import '../../../../../../common/widgets/custom_appbar.dart';
import '../../../../../core/router/app_router.dart';
import '../../../../../core/state/data_state.dart';
import '../../providers/test_class.dart';
import '../../widget/available_builder.dart';
import '../../widget/available_times_builder.dart';
import 'appiontment_type_selection_notifier.dart';

@RoutePage()
class BookExpertPage extends StatefulWidget {
  const BookExpertPage({Key? key}) : super(key: key);

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
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: "Nate Berkus",
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
          Expanded(
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
                itemCount: apiResponse.data?.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      //appRouter.push(const SuccessRoute());
                    },
                    child: SlotsBuilder(
                      appointmentType: apiResponse.data?[index],
                      isSelected: selectedIndex == index,
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
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
                        itemCount: availabilitiesResponse.data?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return AvailableTimeBuilder(
                            availability: availabilitiesResponse.data?[index],
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
