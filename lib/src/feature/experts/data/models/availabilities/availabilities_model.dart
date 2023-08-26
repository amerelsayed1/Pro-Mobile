import 'slots.dart';

class AvailabilitiesModel {
  AvailabilitiesModel({
    this.id,
    this.expertId,
    this.date,
    this.slots,
    //this.booked,
  });

  AvailabilitiesModel.fromJson(dynamic json) {
    id = json['id'];
    expertId = json['expertId'];
    date = json['date'];
    if (json['slots'] != null) {
      slots = [];
      json['slots'].forEach((v) {
        slots?.add(Slots.fromJson(v));
      });
    }
   /* if (json['booked'] != null) {
      booked = [];
      json['booked'].forEach((v) {
        booked.add(Dynamic.fromJson(v));
      });
    }*/
  }

  int? id;
  int? expertId;
  String? date;
  List<Slots>? slots;
  //List<dynamic> booked;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['expertId'] = expertId;
    map['date'] = date;
    if (slots != null) {
      map['slots'] = slots?.map((v) => v.toJson()).toList();
    }
   /* if (booked != null) {
      map['booked'] = booked.map((v) => v.toJson()).toList();
    }*/
    return map;
  }



}
