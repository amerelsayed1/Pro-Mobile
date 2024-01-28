import 'package:flutter/material.dart';

import '../../../../../common/app_colors.dart';
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
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: widget.isSelected ? AppColors.selectedColor : AppColors.unSelectedColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        widget.appointmentType?.type?.appointmentType() ?? "",
        style: TextStyle(
          color: widget.isSelected ? AppColors.whiteColor : AppColors.selectedColor,
          fontWeight: widget.isSelected ? FontWeight.bold : FontWeight.w400,
          fontSize: 16,
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String appointmentType() {
    switch (this) {
      case "QUICK":
        return "Quick - 15 Min";
      case "REGULAR":
        return "Quick - 30 Min";
      case "ALL_ACCESS":
        return "ALL Access - 60 Min";
      default:
        return "";
    }
  }
}
