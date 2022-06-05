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
  final form = GlobalKey<FormState>();
    ///on add form

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Material(
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8),
        child: Form(
          key: form,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppBar(
                leading: Icon(Icons.verified_user),
                elevation: 0,
                title: Text('User Details'),
                backgroundColor: Theme.of(context).accentColor,
                centerTitle: true,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.save),
                    onPressed: (){},
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: TextFormField(
                  initialValue: widget.prodmodel.title,
                  onSaved: (val) => widget.prodmodel.title = val!,
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
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
                child: TextFormField(
                  initialValue: widget.prodmodel.color,
                  onSaved: (val) => widget.prodmodel.color = val!,
                  validator: (val) =>
                      val!.length > 3 ? null : 'Full name is invalid',
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    hintText: 'Enter your email',
                    icon: Icon(Icons.email),
                    isDense: true,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ///form validator
  bool validate() {
    var valid = form.currentState!.validate();
    if (valid) form.currentState!.save();
    return valid;
  }
}
