class AppointmentTypesModel {

  int? id=0;
  String? price='';
  String? type='';
  String? expectations='';

  AppointmentTypesModel({
      this.id, 
      this.price, 
      this.type, 
      this.expectations,});

  AppointmentTypesModel.fromJson(dynamic json) {
    id = json['id'];
    price = json['price'];
    type = json['type'];
    expectations = json['expectations'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['price'] = price;
    map['type'] = type;
    map['expectations'] = expectations;
    return map;
  }

}