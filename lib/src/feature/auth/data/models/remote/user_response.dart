class UserResponse {
  UserResponse({
    required this.id,
    required this.email,
    required this.locale,
    required this.accessToken,
    required this.refreshToken,
  });

  UserResponse.fromJson(dynamic json) {
    id = json['id'];
    email = json['email'];
    locale = json['locale'];
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  int id = 0;
  String email = "";
  String locale = "";
  String accessToken = "";
  String refreshToken = "";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['locale'] = locale;
    map['accessToken'] = accessToken;
    map['refreshToken'] = refreshToken;
    return map;
  }
}
