import 'package:flutter/material.dart';
import 'package:mystore/admin/models/ProductsModel.dart';
import 'package:mystore/admin/ui/productmulti_form.dart';

typedef OnDelete();
typedef OnAddForm();

class DescriptionForm extends StatefulWidget {
  final Description description;
  final state = _DescriptionFormState();
  final OnDelete onDelete;
  final OnAddForm onAddForm;

  DescriptionForm(
      {required Key key,
      required this.description,
      required this.onDelete,
      required this.onAddForm})
      : super(key: key);
  @override
  _DescriptionFormState createState() => state;

  //bool isValid() => state.validate();
}

class _DescriptionFormState extends State<DescriptionForm> {
  final form = GlobalKey<FormState>();

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
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context)
                  .push( MaterialPageRoute(builder: (_) => new  ProductMultiForm()))
                ),
                elevation: 0,
                title: Text('User Details'),
                backgroundColor: Theme.of(context).accentColor,
                centerTitle: true,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: widget.onDelete,
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: widget.onAddForm,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: TextFormField(
                  initialValue: widget.description.lang,
                  onSaved: (val) => widget.description.lang = val!,
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
                  initialValue: widget.description.details,
                  onSaved: (val) => widget.description.details = val!,
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
