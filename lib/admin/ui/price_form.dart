import 'package:flutter/material.dart';
import 'package:mystore/admin/models/ProductsModel.dart';





class PriceForm extends StatefulWidget {
  final ProductsModel prodmodel;
  final state = _PriceFormState();


  PriceForm({required Key key, required this.prodmodel}) : super(key: key);
  @override
  _PriceFormState createState() => state;

  bool isValid() => state.validate();
}

class _PriceFormState extends State<PriceForm> {
  final formone = GlobalKey<FormState>();
  TextEditingController titleEditingController = TextEditingController();
    ///on add form
  void onAddFormmodel() {
    setState(() {
      //ProductsModel(title:titleEditingController.text );
      widget.prodmodel.title=titleEditingController.text.toString();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Material(
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8),
        child: Form(
          key: formone,
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
                    onPressed: (){
                      onAddFormmodel();
                    },
                  )
                ],
              ),
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
        
            ],
          ),
        ),
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
