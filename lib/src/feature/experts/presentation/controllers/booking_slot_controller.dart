import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../core/state/data_state.dart';
import '../../data/models/appointment_types_model.dart';
import '../../data/models/availabilities/availabilities_model.dart';
import '../../data/models/availabilities/slots.dart';
import '../../data/models/available_list_model.dart';
import '../../data/models/hours_model.dart';
import '../../domain/repositories/experts_repository.dart';

class BookingSlotController extends GetxController implements GetxService {
  final ExpertsRepository expertsRepository;

  BookingSlotController({
    required this.expertsRepository,
  });

  final slots = <AvailabilitiesModel>[].obs;

  final availableSlotsState = DataState<List<AvailableListModel>>.initial(
    "Initial state",
  ).obs;

  final appointmentsState = DataState<List<AppointmentTypesModel>>.initial(
    "Initial state",
  ).obs;

  var selectedType = Rx<AppointmentTypesModel?>(null);

  var selectedSlotString = Rx<String>("");

  // Method to update the selected type
  void updateSelectedType(AppointmentTypesModel? newType) {
    selectedType.value = newType;

    final preparedList = prepareList(
      slots,
      selectedType.value,
    );
    availableSlotsState.value = DataState.completed(preparedList);
    update();
  }

  void selectSlot(int listIndex, int hoursIndex) {
    var list = availableSlotsState.value.data ?? [];
    for (var element in list) {
      for (var element in element.hoursList) {
        element.isSelected = false;
      }
    }
    list[listIndex].hoursList[hoursIndex].isSelected = true;

    DateTime date = DateTime.parse(availableSlotsState.value.data?[listIndex].date ?? "");
    selectedSlotString.value = "${formatDate(date)}\n${list[listIndex].hoursList[hoursIndex].hour} - ";

    //update();

    availableSlotsState.value.data?.forEach((element) {
      element.hoursList.forEach((element) {
        debugPrint(element.isSelected.toString());
      });
    });
  }


  String formatDate(DateTime date) {
    return DateFormat('EEE, M/d').format(date);
  }

  String getWeekdayName(int weekday) {
    final DateTime now = DateTime.now().toLocal();
    final int diff = now.weekday - weekday;
    DateTime updatedDate;
    if (diff > 0) {
      updatedDate = now.subtract(Duration(days: diff));
    } else if (diff == 0) {
      updatedDate = now;
    } else {
      updatedDate = now.add(Duration(days: diff * -1));
    }
    final String weekdayName = DateFormat('EEEE').format(updatedDate);
    return weekdayName;
  }

  Future<void> fetchData(int? id) async {
    try {
      appointmentsState.value = DataState.loading("Loading....");
      availableSlotsState.value = DataState.loading("Loading....");
      final types = await expertsRepository.getExpertAppointmentTypes(
        id ?? 0,
      );
      appointmentsState.value = DataState.completed(types);

      final slots = await expertsRepository.getAvailableSlots(id ?? 0);
      this.slots.value = slots;
      selectedType.value = appointmentsState.value.data?.first;
      final preparedList = prepareList(
        slots,
        selectedType.value,
      );
      availableSlotsState.value = DataState.completed(preparedList);
    } catch (e) {
      appointmentsState.value = DataState.error("Error loading news: $e");
      availableSlotsState.value = DataState.error("Error loading experts: $e");
    }
  }

  Future<void> fetchExpertAppointmentTypes(int id) async {
    try {
      appointmentsState.value = DataState.loading("Loading news");
      final expertsDetails =
          await expertsRepository.getExpertAppointmentTypes(id);
      appointmentsState.value = DataState.completed(expertsDetails);
    } catch (e) {
      appointmentsState.value = DataState.error("Error loading experts: $e");
    }
  }

  List<AvailableListModel> prepareList(
    List<AvailabilitiesModel> data,
    AppointmentTypesModel? type,
  ) {
    List<AvailableListModel> list = [];
    for (var availability in data) {
      List<HoursModel> listOfHours = slotsListPrep(
        availability.date ?? "",
        availability.slots?[0],
        type,
      );
      list.add(AvailableListModel(availability.date ?? "", listOfHours));
    }
    return list;
  }

  List<HoursModel> slotsListPrep(
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

  Future<void> fetchExpertAvailableSlots(int id) async {
    try {
      availableSlotsState.value = DataState.loading("Loading news");
      final slots = await expertsRepository.getAvailableSlots(id);
      final preparedList = prepareList(slots, selectedType.value);

      availableSlotsState.value = DataState.completed(preparedList);
      /*listOfAvailablility.value = prepareList(
        availableSlotsState.value.data ?? [],
        appointmentType.value,
      );*/
    } catch (e) {
      availableSlotsState.value = DataState.error("Error loading experts: $e");
    }
  }
}
