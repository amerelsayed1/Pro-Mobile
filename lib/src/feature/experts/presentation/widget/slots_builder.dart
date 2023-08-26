import 'package:flutter/material.dart';

import '../../data/models/appointment_types_model.dart';

class SlotsBuilder extends StatefulWidget {

  AppointmentTypesModel? appointmentType;
  bool isSelected = false;

  SlotsBuilder({
    Key? key,
    required this.appointmentType,
    required this.isSelected,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SlotState();
}

class _SlotState extends State<SlotsBuilder> {
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
      child: Center(
        child: Text(
          widget.appointmentType?.type ?? "",
          style: TextStyle(
            color: widget.isSelected ? Colors.blue : Colors.black,
            fontWeight: widget.isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
