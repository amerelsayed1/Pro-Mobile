
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:unknown/src/feature/experts/data/models/appointment_types_model.dart';
import 'package:unknown/src/feature/experts/data/models/availabilities/availabilities_model.dart';
import 'package:unknown/src/feature/experts/presentation/widget/slots_builder.dart';

import '../../../../../../common/widgets/custom_appbar.dart';
import '../../../../../core/state/data_state.dart';
import '../../../data/models/availabilities/slots.dart';
import '../../../data/models/available_list_model.dart';
import '../../../data/models/expert_model.dart';
import '../../../data/models/hours_model.dart';
import '../../controllers/home_controller.dart';
import 'available_test_builder.dart';

class BookExpertPage extends StatefulWidget {
  final ExpertModel? expert;

  const BookExpertPage({Key? key, required this.expert}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BookExpertState();
}

class _BookExpertState extends State<BookExpertPage> {
  final HomeController _homeController = Get.find<HomeController>();
  int selectedIndex = 0;

  List<AvailableListModel> listOfData = [];

  @override
  void initState() {
    super.initState();

    _homeController.fetchExpertAppointmentTypes(
      widget.expert?.id ?? 0,
    );

    _homeController.fetchExpertAvailableSlots(
      widget.expert?.id ?? 0,
    );

    ever(_homeController.appointmentsState,
        (DataState<List<AppointmentTypesModel>> state) {
      if (state.status == Status.COMPLETED) {
        // Handle the completion state
        _handleData();
      }
    });

    ever(
      _homeController.availableSlotsState,
      (DataState<List<AvailabilitiesModel>> state) {
        if (state.status == Status.COMPLETED) {
          // Handle the completion state
          _handleData();
        }
      },
    );
  }

  // Handle the data when both fetches are completed
  void _handleData() {
    final appointmentList = _homeController.appointmentsState.value;
    final slotsList = _homeController.availableSlotsState.value;

    if (appointmentList.status == Status.COMPLETED &&
        slotsList.status == Status.COMPLETED) {
      setState(() {
        // Use the fetched data to prepare your list
        listOfData = prepareList(
          slotsList.data ?? [],
          appointmentList.data?[selectedIndex],
        );
      });
    }
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
            return Text(
              'Error: ${appointmentList.messages}',
            );
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
        Container(
          margin: const EdgeInsetsDirectional.symmetric(
              horizontal: 15, vertical: 10),
          child: const Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "Book a video call",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: appointmentTypeWidget(
            context,
            data,
            slots,
          ),
        ),
        const Divider(
          height: 10,
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
                listOfData,
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
    List<AvailabilitiesModel> slots,
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
                listOfData = prepareList(slots, data[selectedIndex]);
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

  final List<String> dates = [];
  final List<List<String>> hoursPerDate = [];

  Widget slotsListWidget(
    BuildContext context,
    List<AvailableListModel> data,
    List<AppointmentTypesModel> types,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: listOfData.length,
              itemBuilder: (BuildContext context, int index) {
                return AvailableTestTimeBuilder(
                  date: listOfData[index].date,
                  timeSlots: listOfData[index].hoursList,
                  onTimeSelected: (selected) async {
                    handleItemClick(index, selected);
                  },
                );
              }),
        )
      ],
    );
  }

  List<AvailableListModel> prepareList(
    List<AvailabilitiesModel> data,
    AppointmentTypesModel? type,
  ) {
    List<AvailableListModel> list = [];
    for (var availability in data) {
      List<HoursModel> listOfHours = slotsList(
        availability.date ?? "",
        availability.slots?[0],
        type,
      );
      list.add(AvailableListModel(availability.date ?? "", listOfHours));
    }
    return list;
  }

  void handleItemClick(int listIndex, int hoursIndex) {
    for (var element in listOfData) {
      for (var element in element.hoursList) {
        element.isSelected = false;
      }
    }
    listOfData[listIndex].hoursList[hoursIndex].isSelected = true;
    setState(() {});
  }

  List<HoursModel> slotsList(
    String? date,
    Slots? slot,
    AppointmentTypesModel? type,
  ) {
    DateTime startTimeFormatted = DateFormat("yyyy-MM-dd HH:mm").parse(
      "$date ${slot?.from}",
    );
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm aa');
    final String formatted = formatter.format(startTimeFormatted);
    DateTime startTime = formatter.parse(formatted);

    DateTime endTimeFormatted = DateFormat("yyyy-MM-dd HH:mm").parse(
      "$date ${slot?.to}",
    );
    final String endTimeFormattedStr = formatter.format(endTimeFormatted);
    DateTime endTime = formatter.parse(endTimeFormattedStr);

    startTime = DateTime(
      startTime.year,
      startTime.month,
      startTime.day,
      startTime.hour,
      0,
    );

    Duration step = Duration(minutes: type?.minutes ?? 0);
    final DateFormat timeFormatter = DateFormat('HH:mm');
    List<HoursModel> timeSlots = [];
    timeSlots.add(HoursModel(timeFormatter.format(startTime)));
    while (startTime.isBefore(endTime)) {
      DateTime timeIncrement = startTime.add(step);
      final String formatted = timeFormatter.format(timeIncrement);
      timeSlots.add(HoursModel(formatted));
      startTime = timeIncrement;
    }
    return timeSlots;
  }
}
