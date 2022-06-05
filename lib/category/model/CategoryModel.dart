class CategoryModel {
  String? maincategory;
  String? Id;
  List<Subcategory>? subcategory;

  CategoryModel({this.maincategory, this.Id, this.subcategory});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    maincategory = json['maincategory'];
    Id = json['_id'];
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
    data['_id'] = this.Id;
    if (this.subcategory != null) {
      data['subcategory'] = this.subcategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subcategory {
  String? subcatname;
  List<Sublabel>? sublabel;

  Subcategory({this.subcatname, this.sublabel});

  Subcategory.fromJson(Map<String, dynamic> json) {
    subcatname = json['subcatname'];
    if (json['sublabel'] != null) {
      sublabel = <Sublabel>[];
      json['sublabel'].forEach((v) {
        sublabel!.add(new Sublabel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subcatname'] = this.subcatname;
    if (this.sublabel != null) {
      data['sublabel'] = this.sublabel!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sublabel {
  String? sublabelname;

  Sublabel({this.sublabelname});

  Sublabel.fromJson(Map<String, dynamic> json) {
    sublabelname = json['sublabelname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sublabelname'] = this.sublabelname;
    return data;
  }
}
