class CategoryModel {
  int? id;
  String? nameEn;
  String? nameAr;
  String? imageUrl;
  String? createdAt;

  CategoryModel(
      {this.id, this.nameEn, this.nameAr, this.imageUrl, this.createdAt});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['nameEn'];
    nameAr = json['nameAr'];
    imageUrl = json['imageUrl'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nameEn'] = nameEn;
    data['nameAr'] = nameAr;
    data['imageUrl'] = imageUrl;
    data['createdAt'] = createdAt;
    return data;
  }
}
