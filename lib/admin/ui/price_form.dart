import 'package:flutter/material.dart';
import 'package:mystore/admin/models/ProductsModel.dart';
import 'package:mystore/admin/ui/description_form.dart';
import 'package:mystore/admin/ui/productmulti_form.dart';

typedef OnDeletePrice();
typedef OnAddPriceForm();

class PriceForm extends StatefulWidget {
  final Pricepackage pricepackage;

  final state = _PriceFormState();

  PriceForm(
      {required Key key,
      required this.pricepackage,
      required void Function() OnDeletePrice,
      required void Function() OnAddPriceForm})
      : super(key: key);
  @override
  _PriceFormState createState() => state;

  bool isValid() => state.validate();
}

class _PriceFormState extends State<PriceForm> {
  final formtwo = GlobalKey<FormState>();
  TextEditingController buyprice_con = TextEditingController();

  ///on add form
  void onAddFormmodel() {
    setState(() {
      //ProductsModel(title:titleEditingController.text );
      //widget.pricepackage.pricing=Pricing(buyprice:int.parse(buyprice_con.text));
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
          key: formtwo,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppBar(
                leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => ProductMultiForm()))),
                elevation: 0,
                title: Text('Add Price'),
                backgroundColor: Theme.of(context).accentColor,
                centerTitle: true,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.save),
                    onPressed: () {
                      onAddFormmodel();
                    },
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: TextFormField(
                  // initialValue: widget.pricepackage.pricing!.buyprice.toString(),
                  //onSaved: (val) => widget.pricepackage.pricing!.buyprice = val! as int?,
                  controller: buyprice_con,
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
    var valid = formtwo.currentState!.validate();
    if (valid) formtwo.currentState!.save();
    return valid;
  }
}
