import 'dart:ffi';

class RegisterRequest {
  String email;
  String password;
  String nameEn;
  String nameAr;
  String titleEn;
  String titleAr;
  String bioEn;
  String bioAr;
  int categoryId;
  List<int> specialtyIds;

  RegisterRequest(
    this.email,
    this.password,
    this.nameEn,
    this.nameAr,
    this.titleEn,
    this.titleAr,
    this.bioEn,
    this.bioAr,
    this.categoryId,
    this.specialtyIds,
  );

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'nameEn': nameEn,
      'nameAr': nameAr,
      'titleEn': titleEn,
      'titleAr': titleAr,
      'bioEn': bioEn,
      'bioAr': bioAr,
      'categoryId': categoryId,
      'specialtyIds': specialtyIds,
    };
  }
}
