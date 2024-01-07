import 'package:flutter/material.dart';

class TimeBuilder extends StatelessWidget {
  final bool isSelected;
  String time;

  TimeBuilder({
    required this.time,
    this.isSelected = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              time,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w400
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
    );
  }
}
