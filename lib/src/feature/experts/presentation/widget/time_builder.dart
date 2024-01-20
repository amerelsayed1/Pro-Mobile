import 'package:flutter/material.dart';
import 'package:unknown/src/feature/experts/data/models/hours_model.dart';

class TimeBuilder extends StatefulWidget {
  HoursModel time;

  TimeBuilder({
    required this.time,
    Key? key,
  }) : super(key: key);

  @override
  State<TimeBuilder> createState() => _TimeBuilderState();
}

class _TimeBuilderState extends State<TimeBuilder> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: widget.time.isSelected ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            Center(
              child: Text(
                widget.time.hour,
                style: TextStyle(
                  color: widget.time.isSelected ? Colors.white : Colors.black,
                  fontWeight: widget.time.isSelected
                      ? FontWeight.bold
                      : FontWeight.w400,
                ),
              ),
            ),
            const Visibility(
              visible: false,
              child: Center(
                child: Text(
                  "(Sold Out)",
                  style: TextStyle(
                    fontSize: 11,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
