import 'package:unknown/src/feature/experts/data/models/expert_model.dart';

class ExpertResponse {
  List<ExpertModel>? items;
  int? totalPages;
  int? totalElements;
  int? currentPage;
  int? pageSize;
  bool? hasNextPage;
  bool? hasPreviousPage;

  ExpertResponse(
    this.items,
    this.totalPages,
    this.totalElements,
    this.currentPage,
    this.pageSize,
    this.hasNextPage,
    this.hasPreviousPage,
  );

  ExpertResponse.fromJson(dynamic json) {

    if (json['items'] != null) {
      items = <ExpertModel>[];
      json['items'].forEach((v) {
        items!.add(ExpertModel.fromJson(v));
      });
    }

    //items = json['items'];
    totalPages = json['totalPages'];
    totalElements = json['totalElements'];
    currentPage = json['currentPage'];
    pageSize = json['pageSize'];
    hasNextPage = json['hasNextPage'];
    hasPreviousPage = json['hasPreviousPage'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (items != null) {
      map['items'] = items!.map((v) => v.toJson()).toList();
    }
    map['totalPages'] = totalPages;
    map['totalElements'] = totalElements;
    map['currentPage'] = currentPage;
    map['pageSize'] = pageSize;
    map['hasNextPage'] = hasNextPage;
    map['hasPreviousPage'] = hasPreviousPage;
    return map;
  }
}
