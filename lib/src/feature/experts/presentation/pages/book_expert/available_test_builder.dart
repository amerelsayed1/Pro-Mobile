import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import '../../../data/models/hours_model.dart';
import '../../widget/time_builder.dart';

class AvailableTestTimeBuilder extends StatefulWidget {
  AvailableTestTimeBuilder({
    Key? key,
    required this.date,
    required this.timeSlots,
    required this.onTimeSelected,
  }) : super(key: key);

  final String date;
  final List<HoursModel> timeSlots;
  final Function(int) onTimeSelected;

  @override
  State<StatefulWidget> createState() => _CategoryState();
}

class _CategoryState extends State<AvailableTestTimeBuilder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsetsDirectional.symmetric(vertical: 8),
          child: Text(
            widget.date,
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
          itemCount: widget.timeSlots.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                widget.onTimeSelected(index);
               // debugPrint("LOGGING TimeBuilder -> ${widget.timeSlots[index].isSelected}");
                setState(() {});
              },
              child: TimeBuilder(
                time: widget.timeSlots[index],
              ),
            );
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
