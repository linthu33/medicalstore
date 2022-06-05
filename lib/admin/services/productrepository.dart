import 'package:mystore/admin/models/ProductsModel.dart';
import 'package:mystore/admin/services/productservice.dart';

class ProductRepository{
  

  Future<List<ProductsModel>> getProducts() {
    return ProductService().getProduct();
  }
    Future<int> AddProducts(ProductsModel products) {
    return ProductService().createProduct(products);
  }
}