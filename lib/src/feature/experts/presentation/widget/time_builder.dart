import 'package:flutter/material.dart';
import 'package:unknown/src/feature/experts/data/models/hours_model.dart';

class TimeBuilder extends StatelessWidget {

  HoursModel time;
  final bool isSelected;
  final VoidCallback onTap;

  TimeBuilder({
    required this.time,
    this.isSelected = false,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            Center(
              child: Text(
                time.hour,
                style: TextStyle(
                  color: time.isSelected ? Colors.white : Colors.black,
                  fontWeight: time.isSelected ? FontWeight.bold : FontWeight.w400,
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
