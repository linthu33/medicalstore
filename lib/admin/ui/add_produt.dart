import 'package:flutter/material.dart';
import 'package:mystore/admin/models/ProductsModel.dart';

class ProductForm extends StatefulWidget {
  final ProductsModel prodmodel;
  final state = _ProductFormState();

  ProductForm({required Key key, required this.prodmodel}) : super(key: key);
  @override
  _ProductFormState createState() => state;

  bool isValid() => state.validate();
}

class _ProductFormState extends State<ProductForm> {
  final formone = GlobalKey<FormState>();
  TextEditingController titleEditingController = TextEditingController();

  ///on add form
  void onAddFormmodel() {
    setState(() {
      //ProductsModel(title:titleEditingController.text );
      widget.prodmodel.title = titleEditingController.text.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formone,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: TextFormField(
              //initialValue: widget.prodmodel.title,
              controller: titleEditingController,
              validator: (val) =>
                  val!.length > 3 ? null : 'Full name is invalid',
              decoration: const InputDecoration(
                labelText: 'Full Name',
                hintText: 'Enter your full name',
                icon: Icon(Icons.person),
                isDense: true,
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                onAddFormmodel();
              },
              child: Text('add '))
        ],
      ),
    );
  }

  ///form validator
  bool validate() {
    var valid = formone.currentState!.validate();
    if (valid) formone.currentState!.save();
    return valid;
  }
}
