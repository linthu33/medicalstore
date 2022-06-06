
class Pricepackage {
  String? packagename;
  Pricing? pricing;

  Pricepackage({this.packagename, this.pricing});

  Pricepackage.fromJson(Map<String, dynamic> json) {
    packagename = json['packagename'];
    pricing =
        json['pricing'] != null ? new Pricing.fromJson(json['pricing']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['packagename'] = this.packagename;
    if (this.pricing != null) {
      data['pricing'] = this.pricing!.toJson();
    }
    return data;
  }
}

class Pricing {
  int? list;
  int? sellprice;
  int? buyprice;
  int? quantity;
  int? sellquantity;
  String? indate;

  Pricing(
      {this.list,
      this.sellprice,
      this.buyprice,
      this.quantity,
      this.sellquantity,
      this.indate});

  Pricing.fromJson(Map<String, dynamic> json) {
    list = json['list'];
    sellprice = json['sellprice'];
    buyprice = json['buyprice'];
    quantity = json['Quantity'];
    sellquantity = json['sellquantity'];
    indate = json['indate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['list'] = this.list;
    data['sellprice'] = this.sellprice;
    data['buyprice'] = this.buyprice;
    data['Quantity'] = this.quantity;
    data['sellquantity'] = this.sellquantity;
    data['indate'] = this.indate;
    return data;
  }
}
