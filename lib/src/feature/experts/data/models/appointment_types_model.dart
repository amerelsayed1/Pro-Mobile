class AppointmentTypesModel {

  int? id=0;
  String? price='';
  String? type='';
  int? minutes=0;
  String? expectations='';

  AppointmentTypesModel({
      this.id, 
      this.price, 
      this.type, 
      this.minutes,
      this.expectations,});

  AppointmentTypesModel.fromJson(dynamic json) {
    id = json['id'];
    price = json['price'];
    type = json['type'];
    minutes = json['minutes'];
    expectations = json['expectations'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['price'] = price;
    map['type'] = type;
    map['minutes'] = minutes;
    map['expectations'] = expectations;
    return map;
  }

}