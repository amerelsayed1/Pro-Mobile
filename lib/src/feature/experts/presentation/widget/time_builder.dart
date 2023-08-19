import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimeBuilder extends ConsumerWidget {
  const TimeBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(
          3,
        ),
      ),
      child: const Column(
        children: [
          Center(
            child: Text(
              "12:00 AM",
            ),
          ),
          Center(
            child: Text(
              "(Sold Out)",
              style: TextStyle(
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
