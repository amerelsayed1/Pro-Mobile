class SpecialtiesModel {
  int? id;
  String? nameEn;
  String? nameAr;
  int? categoryId;
  String? createdAt;

  SpecialtiesModel({
    this.id,
    this.nameEn,
    this.nameAr,
    this.categoryId,
    this.createdAt,
  });

  SpecialtiesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['nameEn'];
    nameAr = json['nameAr'];
    categoryId = json['categoryId'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nameEn'] = nameEn;
    data['nameAr'] = nameAr;
    data['categoryId'] = categoryId;
    data['createdAt'] = createdAt;
    return data;
  }
}
