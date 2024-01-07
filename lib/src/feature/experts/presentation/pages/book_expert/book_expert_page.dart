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
  final HomeController _homeController = Get.find<HomeController>();
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _homeController.fetchExpertAppointmentTypes(
      widget.expert?.id ?? 0,
    );

    _homeController.fetchExpertAvailableSlots(
      widget.expert?.id ?? 0,
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
        final slotsList = _homeController.availableSlotsState.value;
        switch (appointmentList.status) {
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator());
          case Status.COMPLETED:
            return combineWidgets(
              context,
              appointmentList.data ?? [],
              slotsList.data ?? [],
            );
          case Status.ERROR:
            return Text('Error: ${appointmentList.messages}');
          default:
            return Container();
        }
      }),
    );
  }

  Widget combineWidgets(
    BuildContext context,
    List<AppointmentTypesModel> data,
    List<AvailabilitiesModel> slots,
  ) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: appointmentTypeWidget(
            context,
            data,
          ),
        ),
        Expanded(
          flex: 14,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 0.0, // or set a specific minimum height
            ),
            child: Container(
              margin: const EdgeInsetsDirectional.symmetric(
                horizontal: 15,
              ),
              child: slotsListWidget(
                context,
                slots,
                data,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget appointmentTypeWidget(
    BuildContext context,
    List<AppointmentTypesModel> data,
  ) {
    return Container(
      margin: const EdgeInsetsDirectional.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      child: AlignedGridView.count(
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
            },
            child: SlotsBuilder(
              appointmentType: data[index],
              isSelected: selectedIndex == index,
            ),
          );
        },
      ),
    );
  }

  Widget slotsListWidget(
    BuildContext context,
    List<AvailabilitiesModel> data,
    List<AppointmentTypesModel> types,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return AvailableTimeBuilder(
                  availability: data[index],
                  type: types[selectedIndex].type ?? "",
                  onClick: (item) {
                    appRouter.push(
                      ConfirmBookingRoute(expert: widget.expert!),
                    );
                  },
                );
              }),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
