import 'dart:convert';

import 'package:mystore/category/model/CategoryModel.dart';
import 'package:http/http.dart' as http;

abstract class CategorySerieApi {
  Future<List<CategoryModel>> getCategory();
}

class CategoryService extends CategorySerieApi {
  @override
  Future<List<CategoryModel>> getCategory() async {
    try {
      var uri = Uri.parse("http://192.168.25.29:3000/findAllcategory");
      var response =
          await http.get(uri, headers: {"ContentType": "application/json"});

      var resultsObjsJson = jsonDecode(response.body)['product'] as List;
      List<CategoryModel> plist = resultsObjsJson
          .map((resultJson) => CategoryModel.fromJson(resultJson))
          .toList();
      print(plist);
      return plist;
    } catch (err) {
      return List<CategoryModel>.empty();
    }
  }
}
