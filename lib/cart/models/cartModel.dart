import 'package:equatable/equatable.dart';
import 'package:mystore/catalog/models/catalogmodel.dart';

class CartModel extends Equatable {
  final List<CatlogModel> items;

  CartModel({this.items = const <CatlogModel>[]});
  int get totalPrice {
    return items.fold(0, (total, current) => total + 10);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [items];
}
