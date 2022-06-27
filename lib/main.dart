import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore/admin/bloc/products_bloc.dart';
import 'package:mystore/admin/services/productrepository.dart';
import 'package:mystore/admin/ui/admin_home.dart';
import 'package:mystore/cart/bloc/cart_bloc.dart';
import 'package:mystore/cart/service/shopping_repository.dart';
import 'package:mystore/cart/view/cart_page.dart';
import 'package:mystore/catalog/bloc/catalog_bloc.dart';

import 'package:mystore/catalog/service/catalogrepository.dart';
import 'package:mystore/catalog/ui/catalog_page.dart';
import 'package:mystore/category/bloc/category_bloc.dart';
import 'package:mystore/category/service/CategoryRepository.dart';

import 'home/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
// This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Bloc Tutorial",
        theme: ThemeData(scaffoldBackgroundColor: bgColor),
        home: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (_) =>
                      CatalogBloc(catalogRepository: CatalogRepository())
                        ..add(CatalogLoadedApiEvent())),
              BlocProvider(
                  create: (_) =>
                      CategoryBloc(categoryRepository: CategoryRepository())
                        ..add(CategoryLoadedEvent())),
              BlocProvider(
                  create: (_) =>
                      CartBloc(shoppingRepository: ShoppingRepository())
                        ..add(CartStarted())),
              BlocProvider(
                  create: (_) =>
                      ProductsBloc(productRepository: ProductRepository())
                        ..add(const Productloaded()))
            ],
            child: MaterialApp(
              title: 'shopping cart',
              initialRoute: '/',
              routes: {
                '/': (_) => const AdminHome(),
                '/catalog': (_) => CatalogPage(),
                '/cart': (_) => const CartPage(),
              },
            )));
  }
}
