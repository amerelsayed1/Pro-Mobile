class ExpertModel {
  int id = 0;
  String? nameEn;
  String? nameAr;
  String? titleEn;
  String? titleAr;
  String? bioEn;
  String? bioAr;
  String? createdAt;

  ExpertModel({
    required this.id,
    this.nameEn,
    this.nameAr,
    this.titleEn,
    this.titleAr,
    this.bioEn,
    this.bioAr,
    this.createdAt,
  });

  ExpertModel.fromJson(dynamic json) {
    id = json['id'];
    nameEn = json['nameEn'];
    nameAr = json['nameAr'];
    titleEn = json['titleEn'];
    titleAr = json['titleAr'];
    bioEn = json['bioEn'];
    bioAr = json['bioAr'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['nameEn'] = nameEn;
    map['nameAr'] = nameAr;
    map['titleEn'] = titleEn;
    map['titleAr'] = titleAr;
    map['bioEn'] = bioEn;
    map['bioAr'] = bioAr;
    map['createdAt'] = createdAt;
    return map;
  }
}
