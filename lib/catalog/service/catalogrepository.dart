import 'package:mystore/catalog/models/catalogmodel.dart';
import 'package:mystore/catalog/service/catalogSevice.dart';

class CatalogRepository {
  Future<List<CatlogModel>> getcatlog() {
    return CatalogService().getCatalog();
  }

  Future<CatlogModel> getOneCatlog() {
    return CatalogService().getOneCatlog();
  }
}
