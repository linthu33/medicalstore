import 'package:mystore/catalog/models/catalogmodel.dart';

const _delay = Duration(milliseconds: 800);

class ShoppingRepository {
  final _items = <CatlogModel>[];

  // Future<List<String>> loadCatalog() => Future.delayed(_delay, () => _catalog);

  Future<List<CatlogModel>> loadCartItems() =>
      Future.delayed(_delay, () => _items);

  void addItemToCart(CatlogModel item) => _items.add(item);

  void removeItemFromCart(CatlogModel item) => _items.remove(item);
}
