import 'package:flutter/material.dart';
import 'package:mystore/admin/models/ProductsModel.dart';
import 'package:mystore/admin/ui/ImagePicker.dart';
import 'package:mystore/admin/ui/admin_home.dart';
import 'package:mystore/admin/ui/description_form.dart';
import 'package:mystore/admin/ui/price_form.dart';

class ProductMultiForm extends StatefulWidget {
  @override
  _ProductMultiFormState createState() => _ProductMultiFormState();
}

class _ProductMultiFormState extends State<ProductMultiForm> {
  List<DescriptionForm> descriptionForm = []; //ui for description
  List<Description> description = [];
  List<PriceForm> pricelist = [];
  final formalldata = GlobalKey<FormState>();
  // Obtain shared preferences
  //late Brand brand;
  String _titledata = '';
  final titleController = TextEditingController();
  late TextEditingController titlecon;
  ProductsModel prodmodel = ProductsModel();
  //late final String title;
  // = TextEditingController();

  final BrandNameController = TextEditingController();
  final BrandimgController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //print(prodmodel.title.toString());
    //titleController.addListener(_handleChange);
    print("page initia state");
    print("this is /t ${_titledata}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: .0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const AdminHome()))),
        title: Text('REGISTER USERS'),
        actions: <Widget>[
          ElevatedButton(
            child: Text('Save'),
            // textColor: Colors.white,
            onPressed: onSave,
          )
        ],
      ),
      body: Row(children: [
        Form(
          key: formalldata,
          child: Column(
            children: [
              MyImagePicker(title: "upload image"),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: TextFormField(
                  initialValue: _titledata,
                  //onSaved: (val) => widget.prodmodel.title = val!,

                  onChanged: (value) {
                    setState(() {
                      //titleController.text=value.toString();
                      _titledata = value.toString();
                      //print("ppp set on");
                      print(prodmodel.title);
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'title',
                    hintText: 'Enter your title',
                    icon: Icon(Icons.person),
                    isDense: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: TextFormField(
                  //initialValue: widget.prodmodel.title,
                  controller: BrandNameController,
                  validator: (val) =>
                      val!.length > 3 ? null : 'Brand name is invalid',
                  decoration: const InputDecoration(
                    labelText: 'Brand Name',
                    hintText: 'Enter your Brand name',
                    icon: Icon(Icons.bar_chart),
                    isDense: true,
                  ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text("Please add your description"),
                IconButton(
                    onPressed: () {
                      onAddForm();
                    },
                    icon: Icon(Icons.add))
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text("Please add your product price",
                    style: TextStyle(color: Colors.redAccent, fontSize: 14)),
                IconButton(
                  onPressed: () {
                    onAddPriceForm();
                  },
                  icon: Icon(Icons.add),
                  color: Colors.greenAccent,
                ),
              ]),
              Row(
                children: [
                  ListView.builder(
                    addAutomaticKeepAlives: true,
                    itemCount: pricelist.length,
                    itemBuilder: (_, i) => pricelist[i],
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }

  ///on form user deleted
  void onDelete(Description _user) {
    setState(() {
      var find = descriptionForm.firstWhere((it) => it.description == _user);
      if (find != null) descriptionForm.removeAt(descriptionForm.indexOf(find));
    });
  }

  void onDeletePrice(Pricepackage _price) {
    setState(() {
      var find = pricelist.firstWhere((it) => it.pricepackage == _price);
      if (find != null) pricelist.removeAt(pricelist.indexOf(find));
    });
  }

  ///on add form
  void onAddForm() {
    setState(() {
      var _description = Description();
      descriptionForm.add(DescriptionForm(
        description: _description,
        onDelete: () => onDelete(_description),
        onAddForm: () => onAddForm(),
        key: GlobalKey(),
      ));
    });
  }

  ///on add form
  void onAddPriceForm() {
    setState(() {
      print("addpriceform");
      print(prodmodel.title);

      _titledata = prodmodel.title.toString();
      print("After addpriceform");

      print(prodmodel.title);
      var _pricepackage = Pricepackage();
      pricelist.add(PriceForm(
        key: GlobalKey(),
        pricepackage: _pricepackage,
        OnDeletePrice: () => onDeletePrice(_pricepackage),
        OnAddPriceForm: () => onAddPriceForm(),
      ));
    });
  }

  void onsaveformdata() {
    setState(() {
      prodmodel.title = titleController.text;
      prodmodel.brand = Brand(name: BrandNameController.text);
    });
    // print(prodmodel.toJson());
  }

  ///on save forms
  void onSave() {
    onsaveformdata();
    print('------------------');
    //prodmodel.title=GlobalKey().currentContext.fi

    if (pricelist.length > 0) {
      var allValid = true;
      //descriptionForm.forEach((form) => allValid = allValid && form.isValid());
      if (allValid) {
        var data = descriptionForm.map((it) => it.description).toList();
        var pricedata = pricelist.map((it) => it.pricepackage).toList();
        //prodmodel.description = data.cast<Description>();
        prodmodel.pricetype = pricedata;
        //print(prodmodel.toJson());
        Navigator.push(
          context,
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text('List of Users'),
              ),
              body: ListView.builder(
                itemCount: data.length,
                itemBuilder: (_, i) => ListTile(
                  leading: CircleAvatar(
                    child: Text(data[i].lang.toString()),
                  ),
                  title: Text(data[i].toString()),
                  subtitle: Text(data[i].details.toString()),
                ),
              ),
            ),
          ),
        );
      }
    }
  }
}
