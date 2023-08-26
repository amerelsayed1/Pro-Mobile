class Slots {
  Slots({
    this.from,
    this.to,
  });

  Slots.fromJson(dynamic json) {
    from = json['from'];
    to = json['to'];
  }

  String? from;
  String? to;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['from'] = from;
    map['to'] = to;
    return map;
  }
}
