import 'package:flutter/material.dart';
import 'package:mystore/catalog/models/catalogmodel.dart';

class ProductDeatilPage extends StatelessWidget {
  final CatlogModel catlogModel;
  const ProductDeatilPage({Key? key, required this.catlogModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(catlogModel.title.toString()),
      ),
      body: Column(children: [Text(catlogModel.color.toString())]),
    );
  }
}
