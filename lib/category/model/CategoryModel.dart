import 'dart:convert';

List<CategoryModel> catalogModelFromJson(String str) =>
    List<CategoryModel>.from(
        json.decode(str).map((x) => CategoryModel.fromJson(x)));

String catalogModelToJson(List<CategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  int? Id;
  String? maincategory;
  List<Subcategory>? subcategory;

  CategoryModel({this.maincategory, this.subcategory});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    maincategory = json['maincategory'];
    if (json['subcategory'] != null) {
      subcategory = <Subcategory>[];
      json['subcategory'].forEach((v) {
        subcategory!.add(new Subcategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maincategory'] = this.maincategory;
    if (this.subcategory != null) {
      data['subcategory'] = this.subcategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subcategory {
  String? subcatname;

  Subcategory({this.subcatname});

  Subcategory.fromJson(Map<String, dynamic> json) {
    subcatname = json['subcatname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subcatname'] = this.subcatname;
    return data;
  }
}
