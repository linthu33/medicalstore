// ignore: file_names
import 'dart:convert';

import 'package:mystore/catalog/models/catalogmodel.dart';
import 'package:http/http.dart' as http;

abstract class ServiceApi {
  Future<List<CatlogModel>> getCatalog();
  Future<CatlogModel> getOneCatlog();
}

class CatalogService extends ServiceApi {
  String BASE_URL = "https://jsonplaceholder.typicode.com";
  String ALBUMS = "/albums";
  @override
  Future<List<CatlogModel>> getCatalog() async {
    try {
      var uri = Uri.parse("http://192.168.25.29:3000/findAllprod");
      var response =
          await http.get(uri, headers: {"ContentType": "application/json"});

      var resultsObjsJson = jsonDecode(response.body)['product'] as List;
      List<CatlogModel> plist = resultsObjsJson
          .map((resultJson) => CatlogModel.fromJson(resultJson))
          .toList();

      return plist;
    } catch (e) {
      print("----------------------------------------");
      print(e);
      print("----------------------------------------");
      return List<CatlogModel>.empty();
    }
  }

  @override
  Future<CatlogModel> getOneCatlog() async {
    try {
      var uri = Uri.parse("http://192.168.25.29:3000/findOneprod");
      var response =
          await http.get(uri, headers: {"ContentType": "application/json"});

      var resultsObjsJson = jsonDecode(response.body)['product'];
      CatlogModel plist =
          resultsObjsJson.map((resultJson) => CatlogModel.fromJson(resultJson));

      return plist;
    } catch (error) {
      return CatlogModel();
    }
  }
}
