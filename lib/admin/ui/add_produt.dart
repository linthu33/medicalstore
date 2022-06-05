import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore/admin/bloc/products_bloc.dart';
import 'package:mystore/admin/models/ProductsModel.dart';
import 'package:mystore/admin/ui/muti.dart';


class AddProducts extends StatelessWidget {
 
  const AddProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    
    TextEditingController con_Id = TextEditingController();
    TextEditingController con_title = TextEditingController();
    TextEditingController con_color = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text(" Add product")),
      body: BlocListener<ProductsBloc, ProductsState>(
        listener: (context, state) {
          if (state is ProductsLoadedState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('To Do Added!')));
          }
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              _inpuField("Id", con_Id),
              _inpuField("title", con_title),
              _inpuField("color", con_color),
              Expanded(child: MyWidget()),
              ElevatedButton(
                onPressed: () {
                  var product = ProductsModel(
                      Id: con_Id.value.text,
                      title: con_title.value.text,
                      //description:[{des}],
                      color: con_color.value.text);
                  context
                      .read<ProductsBloc>()
                      .add(ProductAdd(product: product));
                },
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                ),
                child: const Text("Add Product"),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

Column _inpuField(String field, TextEditingController controller) {
  return Column(
    children: [
      Text(
        '$field',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      Container(
        height: 50,
        margin: EdgeInsets.only(bottom: 10),
        width: double.infinity,
        child: TextFormField(
          controller: controller,
        ),
      )
    ],
  );
}
