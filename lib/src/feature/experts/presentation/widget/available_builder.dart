import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';

import '../../data/models/availabilities/availabilities_model.dart';
import 'time_builder.dart';

class AvailableTimeBuilder extends StatefulWidget {
  AvailableTimeBuilder({
    super.key,
    required this.availability,
    required this.type,
    required this.onClick,
  });

  final AvailabilitiesModel? availability;
  final String type;

  Function(String time) onClick;

  @override
  State<StatefulWidget> createState() => _CategoryState();
}

class _CategoryState extends State<AvailableTimeBuilder> {
  int selectedIndex = 0;

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

    Duration step = Duration(minutes: widget.type == "QUICK" ? 15 : 30);

    List<String> timeSlots = [];
    while (startTime.isBefore(endTime)) {
      DateTime timeIncrement = startTime.add(step);
      final DateFormat formatter = DateFormat('HH:mm aa');
      final String formatted = formatter.format(timeIncrement);
      timeSlots.add(formatted /*DateFormat.Hm().format(timeIncrement)*/);
      startTime = timeIncrement;
    }

    var myDate = DateFormat('dd-MM-y').parse(widget.availability?.date ?? "");
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
            return GestureDetector(
              onTap: () {
                widget.onClick.call(timeSlots[index]);
              },
              child: TimeBuilder(
                time: timeSlots[index],
              ),
            );
          },
        ),
      ],
    );
  }

  String getWeekdayName(int weekday) {
    final DateTime now = DateTime.now().toLocal();
    final int diff = now.weekday - weekday; // weekday is our 1-7 ISO value
    var udpatedDt;
    if (diff > 0) {
      udpatedDt = now.subtract(Duration(days: diff));
    } else if (diff == 0) {
      udpatedDt = now;
    } else {
      udpatedDt = now.add(Duration(days: diff * -1));
    }
    final String weekdayName = DateFormat('EEEE').format(udpatedDt);
    return weekdayName;
  }
}
