

import 'package:primary_app/model/categories.dart';

class Style {
  int? id;
  String? code;
  String? description;
  Categories? categoriesId;
  String? createdAt;
  String? updatedAt;

  Style(
      {this.id,
        this.code,
        this.description,
        this.categoriesId,
        this.createdAt,
        this.updatedAt});

  Style.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    description = json['description'];
    categoriesId = json['categoriesId'] != null
        ? new Categories.fromJson(json['categoriesId'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['description'] = this.description;
    if (this.categoriesId != null) {
      data['categoriesId'] = this.categoriesId!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}