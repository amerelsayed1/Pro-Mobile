import 'package:flutter/cupertino.dart';

class AppointmentSelectionNotifier extends ChangeNotifier {
  int selectedIndex = 0;
  int listIndex = 0;
  bool isSelected = true;

  AppointmentSelectionNotifier();

  selectedPosition(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  listPosition(int index) {
    listIndex = index;
    notifyListeners();
  }

  checkIsSelected() {
    isSelected = selectedIndex == listIndex;
    notifyListeners();
  }
}
