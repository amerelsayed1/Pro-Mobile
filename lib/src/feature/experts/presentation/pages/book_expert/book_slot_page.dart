import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unknown/common/widgets/custom_appbar.dart';
import 'package:unknown/src/core/router/route_helper.dart';
import 'package:unknown/src/feature/experts/presentation/controllers/booking_slot_controller.dart';
import 'package:unknown/src/feature/experts/presentation/pages/book_expert/slots_widget.dart';

import '../../../../../../common/app_colors.dart';
import '../../../../../core/state/data_state.dart';
import '../../../data/models/expert_model.dart';
import '../../controllers/home_controller.dart';
import '../../widget/slots_builder.dart';
import 'available_test_builder.dart';

class BookSlotPage extends StatefulWidget {
  final ExpertModel? expert;

  const BookSlotPage({super.key, required this.expert});

  @override
  State<StatefulWidget> createState() => _BookSlotState();
}

class _BookSlotState extends State<BookSlotPage> {
  final BookingSlotController _bookingSlotController =
      Get.find<BookingSlotController>();

  int selectedIndex = 0;
  String selectedDate = "Looking for a time not listed?";
  String selectedSlot = "Tap here to request a time";

  @override
  void initState() {
    super.initState();
    _bookingSlotController.fetchData(
      widget.expert?.id ?? 0,
    );

    /* _bookingSlotController.fetchExpertAvailableSlots(
      widget.expert?.id ?? 0,
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
      ),
      body: Obx(() {
        final appointmentList = _bookingSlotController.appointmentsState.value;
        final slotsList = _bookingSlotController.availableSlotsState.value;

        switch (appointmentList.status) {
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator());
          case Status.COMPLETED:
            return Column(
              children: [
                Container(
                  margin: const EdgeInsetsDirectional.symmetric(
                    horizontal: 15,
                  ),
                  child: const Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      'Book a video call',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsetsDirectional.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  child: const Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      'Select one of the available time slots below:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsetsDirectional.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  child: Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      alignment: WrapAlignment.start,
                      children: List.generate(appointmentList.data?.length ?? 0,
                          (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                            _bookingSlotController.updateSelectedType(
                              appointmentList.data?[selectedIndex],
                            );
                          },
                          child: SlotsBuilder(
                            appointmentType: appointmentList.data?[index],
                            isSelected: selectedIndex == index,
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    margin: const EdgeInsetsDirectional.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    child: ListView.builder(
                      itemCount: slotsList.data?.length,
                      itemBuilder: (context, index) {
                        //return SlotsWidget(slot: slotsList.data?[index]);
                        return AvailableTestTimeBuilder(
                          date: slotsList.data?[index].date ?? "",
                          timeSlots: slotsList.data?[index].hoursList ?? [],
                          onTimeSelected: (selected) async {
                            _bookingSlotController.selectSlot(index, selected);
                            setState(() {});
                          },
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsetsDirectional.symmetric(
                          horizontal: 15,
                        ),
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            _bookingSlotController.selectedSlotString.value,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsetsDirectional.symmetric(
                          horizontal: 15,
                        ),
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            _bookingSlotController
                                    .selectedType.value?.expectations ??
                                "",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: const EdgeInsetsDirectional.symmetric(
                                horizontal: 15,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: Text(
                                  "${appointmentList.data?[selectedIndex].price} . Session",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.blueColor,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              margin: const EdgeInsetsDirectional.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Get.toNamed(RouteHelper.successStatus);
                                },
                                child: const Text(
                                  "Next",
                                  style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
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
}
