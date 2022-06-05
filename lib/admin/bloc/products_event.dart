part of 'products_bloc.dart';

@immutable
abstract class ProductsEvent {
  const ProductsEvent();
}

class Productloaded extends ProductsEvent{
  //final List<ProductsModel> products;

  const Productloaded();
  List<Object?> get props => [];
}
class ProductAdd extends ProductsEvent{
  final ProductsModel product;

  const ProductAdd({required this.product});
  
  List<Object?> get props => [product];
}
class ProductUpdate extends ProductsEvent{
 final ProductsModel product;

  const ProductUpdate(this.product);

  List<Object?> get props => [product];
}
class ProductDelete extends ProductsEvent{
  final ProductsModel product;

  const ProductDelete(this.product);

  List<Object?> get props => [product];
}
