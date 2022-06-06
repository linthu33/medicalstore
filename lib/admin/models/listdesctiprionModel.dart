
class ListDescription {
  String? lang;
  String? details;

  ListDescription({ this.lang,  this.details});

  ListDescription.fromJson(Map<String, dynamic> json) {
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
