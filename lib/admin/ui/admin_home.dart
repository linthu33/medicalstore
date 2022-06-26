import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore/admin/bloc/products_bloc.dart';
import 'package:mystore/admin/models/ProductsModel.dart';
import 'package:mystore/admin/ui/dynamictext.dart';
import 'package:mystore/admin/ui/productmulti_form.dart';
import 'package:mystore/admin/ui/wizard.dart';



class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Medical Store Admin Panel"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WizardForm()));
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body:
            BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
          if (state is ProductsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ProductsLoadedState) {
            List<ProductsModel> products = state.products;
            return ListView.builder(
              shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return _ProductList(products[index]);
                });
          }
          return const Center(
            child: Text('Something went wrong!'),
          );
        }));
  }
}

Card _ProductList(ProductsModel product) {
  return Card(
    margin: const EdgeInsets.only(bottom: 8.0),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(product.color.toString()),
      Row(
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add_task)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.cancel))
        ],
      )
    ]),
  );
}
