import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';

import '../../data/models/availabilities/availabilities_model.dart';
import 'time_builder.dart';

class AvailableTimeBuilder extends StatefulWidget {
  AvailableTimeBuilder({
    Key? key,
    required this.availability,
    required this.type,
    required this.onClick,
    required this.onItemSelected,
  }) : super(key: key);

  final AvailabilitiesModel? availability;
  final String type;
  final Function(String time) onClick;
  final Function(int selectedIndex) onItemSelected;

  @override
  State<StatefulWidget> createState() => _CategoryState();
}

class _CategoryState extends State<AvailableTimeBuilder> {

  int selectedIndex = 0;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime startTimeFormatted = DateFormat("yyyy-MM-dd HH:mm").parse(
      "${widget.availability?.date} ${widget.availability?.slots?[0].from}",
    );
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm aa');
    final String formatted = formatter.format(startTimeFormatted);
    DateTime startTime = formatter.parse(formatted);

    DateTime endTimeFormatted = DateFormat("yyyy-MM-dd HH:mm").parse(
      "${widget.availability?.date} ${widget.availability?.slots?[0].to}",
    );
    final String endTimeFormattedStr = formatter.format(endTimeFormatted);
    DateTime endTime = formatter.parse(endTimeFormattedStr);

    startTime = DateTime(startTime.year, startTime.month, startTime.day, startTime.hour, 0);

    Duration step = Duration(minutes: widget.type == "QUICK" ? 15 : 30);

    final DateFormat timeFormatter = DateFormat('HH:mm');
    List<String> timeSlots = [];

    timeSlots.add(timeFormatter.format(startTime));
    while (startTime.isBefore(endTime)) {
      DateTime timeIncrement = startTime.add(step);
      final String formatted = timeFormatter.format(timeIncrement);
      timeSlots.add(formatted);
      startTime = timeIncrement;
    }

    var myDate = DateFormat('yyyy-MM-dd').parse(
      widget.availability?.date ?? "",
    );
    var availabilityDateStr =
        "${getWeekdayName(myDate.weekday)} ${myDate.day}-${myDate.month}";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsetsDirectional.symmetric(vertical: 8),
          child: Text(
            availabilityDateStr,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 16,
            ),
          ),
        ),
        AlignedGridView.count(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          crossAxisCount: 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 8,
          itemCount: timeSlots.length,
          itemBuilder: (context, index) {
            return Container()/*GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                widget.onClick.call(timeSlots[index]);
                widget.onItemSelected(selectedIndex);
              },
              child: TimeBuilder(
                time: timeSlots[index],
                isSelected: index == selectedIndex,
              ),
            )*/;
          },
        ),
      ],
    );
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
}
