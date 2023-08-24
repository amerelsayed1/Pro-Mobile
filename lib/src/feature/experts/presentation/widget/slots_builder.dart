import 'package:flutter/material.dart';

class SlotsBuilder extends StatelessWidget {
  const SlotsBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(3),
      ),
      child: const Center(
        child: Text(
          "Quick - 15 Min",
        ),
      ),
    );
  }


}
