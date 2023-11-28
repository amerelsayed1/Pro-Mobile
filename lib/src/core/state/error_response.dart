import 'dart:convert';


class ErrorResponse {
  ErrorResponse({
    this.status,
    this.error,
    this.messages,
    this.time,
    this.stackTrace,
  });

  ErrorResponse.fromJson(dynamic json) {
    status = json['status'];
    error = json['error'];
   messages = json['messages'] != null ? json['messages'].cast<String>() : [];
    time = json['time'];
    stackTrace = json['stackTrace'];
  }

  int? status;
  String? error;
  List<String>? messages;
  String? time;
  String? stackTrace;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['error'] = error;
    map['messages'] = messages;
    map['time'] = time;
    map['stackTrace'] = stackTrace;
    return map;
  }
}
