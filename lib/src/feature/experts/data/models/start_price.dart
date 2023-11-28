class StartPrice {
  double? amount;
  String? currency;
  bool? positive;

  StartPrice({
    this.amount,
    this.currency,
    this.positive,
  });

  StartPrice.fromJson(dynamic json) {
    amount = json['amount'];
    currency = json['currency'];
    positive = json['positive'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount'] = amount;
    map['currency'] = currency;
    map['positive'] = positive;
    return map;
  }
}
