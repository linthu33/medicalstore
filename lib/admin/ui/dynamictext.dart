/* import 'package:flutter/material.dart';
import 'package:mystore/admin/models/ProductsModel.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class MyAddProduct extends StatefulWidget {
  const MyAddProduct({Key? key}) : super(key: key);

  @override
  State<MyAddProduct> createState() => _MyAddProductState();
}

class _MyAddProductState extends State<MyAddProduct> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  ProductsModel productmodel = ProductsModel();
  //List<Description> productmodel.description =[];
  void initState() {
    super.initState();
    //productmodel.description = List<Description>.empty(growable: true);
    //productmodel.description!
    //    .add(Description(Did: 1, lang: 'mm', details: 'da ko'));
    //productmodel.description!.add(Description(lang: 'mm', details: 'da ko'));
    //desc.add(Description(lang: 'mm', details: 'da ko'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('descript'),),
      body: _uiForm(),
    );
  }

  Widget _uiForm() {
    return  Form(
        key: globalKey,
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FormHelper.inputFieldWidgetWithLabel(
              context,
              "titlename",
              "Category Name",
              "",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return 'Category Name can\'t be empty.';
                }

                return null;
              },
              (onSavedVal) => {
                
                productmodel.title = onSavedVal,
              },
              initialValue: productmodel.title.toString(),
              obscureText: false,
              borderFocusColor: Theme.of(context).primaryColor,
              prefixIconColor: Theme.of(context).primaryColor,
              borderColor: Theme.of(context).primaryColor,
              borderRadius: 10,
              paddingLeft: 0,
              paddingRight: 0,
              showPrefixIcon: true,
              prefixIcon: Icon(Icons.web),
              onChange: (val) {},
            ),
           // _descriptionContainer(),
            Center(
              child: FormHelper.submitButton(
                "save",
                () {

                },
                btnColor: Theme.of(context).primaryColor,
                borderColor: Theme.of(context).primaryColor,
                txtColor: Colors.black,
              ),
            )
          ],
        )));
  }

  Widget _descriptionContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Descriptions",
          textAlign: TextAlign.center,
        ),
        //_descriptionUI(0)
        ListView.separated(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [_descriptionUI(index)],
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: productmodel.description!.length)
      ],
    );
  }

  Widget _descriptionUI(index) {
    void addDescription() {
      print(index.toString());
      setState(() {
        productmodel.description!
            .add(Description(Did: 1, lang: 'mm', details: 'da ko'));
      });
      print(productmodel.description![index]);
    }

    void removeDescription(index) {
      setState(() {
        if (productmodel.description!.length > 1) {
          productmodel.description!.removeWhere((item) => item.Did == index);
        }
      });
      print("After remove");
      print(index.toString());
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        Flexible(
          child: FormHelper.inputFieldWidgetWithLabel(
            context,
            "productmodel.description$index.lang",
            "",
            "hintText",
            (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return 'description$index.lang -1 is not empty';
              }
            },
            (onSavedVal) {
              productmodel.description![index].lang = onSavedVal;
            },
            initialValue: "",
            obscureText: false,
            borderFocusColor: Theme.of(context).primaryColor,
            prefixIconColor: Theme.of(context).primaryColor,
            borderColor: Theme.of(context).primaryColor,
          ),
        ),
        Visibility(
          child: SizedBox(
            width: 35,
            child: IconButton(
                onPressed: () {
                  addDescription();
                },
                icon: Icon(
                  Icons.add_circle,
                  color: Colors.green,
                )),
          ),
          visible: index == productmodel.description!.length - 1,
        ),
        Visibility(
          child: SizedBox(
            width: 35,
            child: IconButton(
                onPressed: () {
                  removeDescription(index);
                },
                icon: Icon(
                  Icons.remove_circle,
                  color: Color.fromARGB(255, 243, 191, 191),
                )),
          ),
          visible: index > 0,
        )
      ]),
    );
  }
}
 */