// To parse this JSON data, do
//
//     final catlogModel = catlogModelFromJson(jsonString);

import 'dart:convert';

CatlogModel catlogModelFromJson(String str) =>
    CatlogModel.fromJson(json.decode(str));

String catlogModelToJson(CatlogModel data) => json.encode(data.toJson());
/* List<CatlogModel> catalogModelFromJson(String str) => List<CatlogModel>.from(
    json.decode(str).map((x) => CatlogModel.fromJson(x)));

String catalogModelToJson(List<CatlogModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson()))); */

class CatlogModel {
  String? Id;
  Brand? brand;
  Shipping? shipping;
  ReviewPoint? reviewPoint;
  String? title;
  String? experDate;
  List<Images>? images;
  String? color;
  List<Description>? description;
  String? certification;
  String? returnPolicy;
  String? sublabel;
  PricetypeId? pricetypeId;
  MaincategoryId? maincategoryId;

  CatlogModel(
      {this.Id,
      this.brand,
      this.shipping,
      this.reviewPoint,
      this.title,
      this.experDate,
      this.images,
      this.color,
      this.description,
      this.certification,
      this.returnPolicy,
      this.sublabel,
      this.pricetypeId,
      this.maincategoryId});

  CatlogModel.fromJson(Map<String, dynamic> json) {
    Id = json['Id'];
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    shipping = json['shipping'] != null
        ? new Shipping.fromJson(json['shipping'])
        : null;
    reviewPoint = json['reviewPoint'] != null
        ? new ReviewPoint.fromJson(json['reviewPoint'])
        : null;
    title = json['title'];
    experDate = json['experDate'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    color = json['color'];
    if (json['description'] != null) {
      description = <Description>[];
      json['description'].forEach((v) {
        description!.add(new Description.fromJson(v));
      });
    }
    certification = json['certification'];
    returnPolicy = json['returnPolicy'];
    sublabel = json['sublabel'];
    pricetypeId = json['pricetype_id'] != null
        ? new PricetypeId.fromJson(json['pricetype_id'])
        : null;
    maincategoryId = json['maincategory_id'] != null
        ? new MaincategoryId.fromJson(json['maincategory_id'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    if (this.shipping != null) {
      data['shipping'] = this.shipping!.toJson();
    }
    if (this.reviewPoint != null) {
      data['reviewPoint'] = this.reviewPoint!.toJson();
    }
    data['title'] = this.title;
    data['Id'] = this.Id;
    data['experDate'] = this.experDate;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['color'] = this.color;
    if (this.description != null) {
      data['description'] = this.description!.map((v) => v.toJson()).toList();
    }
    data['certification'] = this.certification;
    data['returnPolicy'] = this.returnPolicy;
    data['sublabel'] = this.sublabel;
    if (this.pricetypeId != null) {
      data['pricetype_id'] = this.pricetypeId!.toJson();
    }
    if (this.maincategoryId != null) {
      data['maincategory_id'] = this.maincategoryId!.toJson();
    }
    return data;
  }
}

class Brand {
  String? name;
  String? img;

  Brand({this.name, this.img});

  Brand.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['img'] = this.img;
    return data;
  }
}

class Shipping {
  Dimensions? dimensions;
  int? weigh;

  Shipping({this.dimensions, this.weigh});

  Shipping.fromJson(Map<String, dynamic> json) {
    dimensions = json['dimensions'] != null
        ? new Dimensions.fromJson(json['dimensions'])
        : null;
    weigh = json['weigh'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dimensions != null) {
      data['dimensions'] = this.dimensions!.toJson();
    }
    data['weigh'] = this.weigh;
    return data;
  }
}

class Dimensions {
  int? width;
  int? height;
  int? depth;

  Dimensions({this.width, this.height, this.depth});

  Dimensions.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    height = json['height'];
    depth = json['depth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['width'] = this.width;
    data['height'] = this.height;
    data['depth'] = this.depth;
    return data;
  }
}

class ReviewPoint {
  String? username;
  int? count;

  ReviewPoint({this.username, this.count});

  ReviewPoint.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['count'] = this.count;
    return data;
  }
}

class Images {
  Img? img;

  Images({this.img});

  Images.fromJson(Map<String, dynamic> json) {
    img = json['img'] != null ? new Img.fromJson(json['img']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.img != null) {
      data['img'] = this.img!.toJson();
    }
    return data;
  }
}

class Img {
  int? height;
  String? src;
  int? width;

  Img({this.height, this.src, this.width});

  Img.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    src = json['src'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['src'] = this.src;
    data['width'] = this.width;
    return data;
  }
}

class Description {
  String? lang;
  String? details;

  Description({this.lang, this.details});

  Description.fromJson(Map<String, dynamic> json) {
    lang = json['lang'];
    details = json['details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lang'] = this.lang;
    data['details'] = this.details;
    return data;
  }
}

class PricetypeId {
  String? pricetype;
  List<Packagetype>? packagetype;
  List<Inventorylist>? inventorylist;

  PricetypeId({this.pricetype, this.packagetype, this.inventorylist});

  PricetypeId.fromJson(Map<String, dynamic> json) {
    pricetype = json['pricetype'];
    if (json['packagetype'] != null) {
      packagetype = <Packagetype>[];
      json['packagetype'].forEach((v) {
        packagetype!.add(new Packagetype.fromJson(v));
      });
    }
    if (json['inventorylist'] != null) {
      inventorylist = <Inventorylist>[];
      json['inventorylist'].forEach((v) {
        inventorylist!.add(new Inventorylist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pricetype'] = this.pricetype;
    if (this.packagetype != null) {
      data['packagetype'] = this.packagetype!.map((v) => v.toJson()).toList();
    }
    if (this.inventorylist != null) {
      data['inventorylist'] =
          this.inventorylist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Packagetype {
  Pricing? pricing;
  String? packagename;

  Packagetype({this.pricing, this.packagename});

  Packagetype.fromJson(Map<String, dynamic> json) {
    pricing =
        json['pricing'] != null ? new Pricing.fromJson(json['pricing']) : null;
    packagename = json['packagename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pricing != null) {
      data['pricing'] = this.pricing!.toJson();
    }
    data['packagename'] = this.packagename;
    return data;
  }
}

class Pricing {
  int? list;
  int? sellprice;
  int? buyprice;

  Pricing({this.list, this.sellprice, this.buyprice});

  Pricing.fromJson(Map<String, dynamic> json) {
    list = json['list'];
    sellprice = json['sellprice'];
    buyprice = json['buyprice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['list'] = this.list;
    data['sellprice'] = this.sellprice;
    data['buyprice'] = this.buyprice;
    return data;
  }
}

class Inventorylist {
  Inventory? inventory;

  Inventorylist({this.inventory});

  Inventorylist.fromJson(Map<String, dynamic> json) {
    inventory = json['inventory'] != null
        ? new Inventory.fromJson(json['inventory'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.inventory != null) {
      data['inventory'] = this.inventory!.toJson();
    }
    return data;
  }
}

class Inventory {
  int? quantity;
  int? sellquantity;
  String? indate;

  Inventory({this.quantity, this.sellquantity, this.indate});

  Inventory.fromJson(Map<String, dynamic> json) {
    quantity = json['Quantity'];
    sellquantity = json['sellquantity'];
    indate = json['indate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Quantity'] = this.quantity;
    data['sellquantity'] = this.sellquantity;
    data['indate'] = this.indate;
    return data;
  }
}

class MaincategoryId {
  String? maincategory;
  List<Subcategory>? subcategory;

  MaincategoryId({this.maincategory, this.subcategory});

  MaincategoryId.fromJson(Map<String, dynamic> json) {
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
