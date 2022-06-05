import '../model/CategoryModel.dart';
import 'CategoryService.dart';

class CategoryRepository {
  Future<List<CategoryModel>> getCategory() {
    return CategoryService().getCategory();
  }
}
