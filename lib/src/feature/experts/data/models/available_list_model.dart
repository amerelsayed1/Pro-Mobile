import 'package:unknown/src/feature/experts/data/models/hours_model.dart';

class AvailableListModel {
  String date;
  List<HoursModel> hoursList = [];

  AvailableListModel(
    this.date,
    this.hoursList,
  );
}
