import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';

import '../../data/models/availabilities/availabilities_model.dart';
import 'time_builder.dart';

class AvailableTimesBuilder extends StatelessWidget {
  AvailabilitiesModel availability;

  AvailableTimesBuilder(this.availability, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime startTime = DateTime(now.year, now.month, now.day, 8, 0, 0);
    DateTime endTime = DateTime(now.year, now.month, now.day, 22, 0, 0);
    Duration step = Duration(minutes: 30);

    List<String> timeSlots = [];

    while (startTime.isBefore(endTime)) {
      DateTime timeIncrement = startTime.add(step);
      timeSlots.add(DateFormat.Hm().format(timeIncrement));
      startTime = timeIncrement;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsetsDirectional.symmetric(vertical: 8),
          child: Text(
            availability.date ?? "",
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
            return TimeBuilder(
              time: timeSlots[index],
            );
          },
        ),
      ],
    );
  }
}
