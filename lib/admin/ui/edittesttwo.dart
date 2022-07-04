import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:mystore/admin/bloc/products_bloc.dart';
import 'package:mystore/admin/models/ProductsModel.dart';

class EditTestTwo extends StatefulWidget {
  EditTestTwo({Key? key, required this.prodedit}) : super(key: key);
  final ProductsModel prodedit;
  final GlobalKey<_EditTestTwoState> mykey = GlobalKey();
  @override
  State<EditTestTwo> createState() => _EditTestTwoState();
}

class _EditTestTwoState extends State<EditTestTwo> {
  List<Description>? editdes = [];
  List<Pricepackage>? editprice = [];
  late bool _isDesButton;
  late TextEditingController contitle;
  late TextEditingController concolor;
  late TextEditingController conbrand;
  late TextEditingController conship_weight;
  late TextEditingController conship_dim_weight;
  late TextEditingController conship_dim_hight;
  late TextEditingController conship_dim_depth;
  @override
  void initState() {
    super.initState();
    _isDesButton = false;
    contitle = TextEditingController(text: widget.prodedit.title);
    contitle.addListener(() {
      setState(() {});
    });
    concolor = TextEditingController(text: widget.prodedit.color);
    concolor.addListener(() {
      setState(() {});
    });
    conbrand = TextEditingController(text: widget.prodedit.brand!.name);
    conbrand.addListener(() {
      setState(() {});
    });
    conship_weight =
        TextEditingController(text: widget.prodedit.shipping!.weigh.toString());
    conship_weight.addListener(() {
      setState(() {});
    });
    conship_dim_weight = TextEditingController(
        text: widget.prodedit.shipping!.dimensions!.width.toString());
    conship_dim_weight.addListener(() {
      setState(() {});
    });
    conship_dim_hight = TextEditingController(
        text: widget.prodedit.shipping!.dimensions!.height.toString());
    conship_dim_hight.addListener(() {
      setState(() {});
    });
    conship_dim_depth = TextEditingController(
        text: widget.prodedit.shipping!.dimensions!.depth.toString());
    conship_dim_depth.addListener(() {
      setState(() {});
    });
    //editdes!.addAll(widget.prodedit.description!);
    //print(editdes!.first.details);
  }

  void EditProduct() {
    var pdata = ProductsModel(
        Id: widget.prodedit.Id,
        title: contitle.text,
        color: concolor.text,
        brand: Brand(name: conbrand.text),
        shipping: Shipping(
            weigh: int.parse(conship_weight.text),
            dimensions: Dimensions(
                width: int.parse(conship_dim_weight.text),
                height: int.parse(conship_dim_hight.text),
                depth: int.parse(conship_dim_depth.text))),
        //shipping: ,
        description: editdes ?? widget.prodedit.description,
        pricetype: editprice ?? widget.prodedit.pricetype);

    //widget.mykey.currentState.
    print(pdata.toJson(pdata));
  }

  void EditDesctiption(newtext, findtext) {
    setState(() {
      Description? update =
          widget.prodedit.description!.firstWhere((e) => e.lang == findtext);
      if (update != null) {
        update.details = newtext;
        editdes!.add(update);
        _isDesButton = true;
      } else
        print("no update");
    });
  }

  void EditPrice(newlist, newsellprice, newbuyprice, newquantity,
      newsellquantity, findtext) {
    print(findtext);
    setState(() {
      Pricepackage? pupdate = widget.prodedit.pricetype!
          .firstWhere((e) => e.pricepackagename == findtext);
      // ignore: unnecessary_null_comparison
      if (pupdate != null) {
        pupdate.list = int.parse(newlist);
        pupdate.sellprice = int.parse(newsellprice);
        pupdate.buyprice = int.parse(newbuyprice);
        pupdate.quantity = int.parse(newquantity);
        pupdate.sellquantity = int.parse(newsellquantity);
        editprice!.add(pupdate);
      } else
        print("no update");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: 40,
                top: 10,
                right: 40,
                bottom: 20,
              ),
              child: TextField(
                controller: contitle,
                decoration: const InputDecoration(
                  labelText: "title",
                  //border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40,
                top: 10,
                right: 40,
                bottom: 20,
              ),
              child: TextField(
                controller: concolor,
                decoration: const InputDecoration(
                  labelText: "Color",
                  //border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40,
                top: 10,
                right: 40,
                bottom: 20,
              ),
              child: TextField(
                controller: conbrand,
                decoration: const InputDecoration(
                  labelText: "Brand",
                  //border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40,
                top: 10,
                right: 40,
                bottom: 20,
              ),
              child: TextField(
                controller: conship_weight,
                decoration: const InputDecoration(
                  labelText: "Shiping Weight",
                  //border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40,
                top: 10,
                right: 40,
                bottom: 20,
              ),
              child: TextField(
                controller: conship_dim_weight,
                decoration: const InputDecoration(
                  labelText: "Shiping Dimension weight",
                  //border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40,
                top: 10,
                right: 40,
                bottom: 20,
              ),
              child: TextField(
                controller: conship_dim_hight,
                decoration: const InputDecoration(
                  labelText: "Shipping Dimension height",
                  //border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40,
                top: 10,
                right: 40,
                bottom: 20,
              ),
              child: TextField(
                controller: conship_dim_depth,
                decoration: const InputDecoration(
                  labelText: "Shipping Dimension depth",
                  //border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                margin: const EdgeInsets.all(20),
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.green, width: 1)),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: widget.prodedit.description!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(4),
                        child: RenderDestrition(
                            description: widget.prodedit.description![index],
                            //counterKey: widget.mykey,
                            onEditDes: EditDesctiption,
                            index: index,
                            isButton: _isDesButton),
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                margin: EdgeInsets.all(20),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: widget.prodedit.pricetype!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(4),
                        child: RenderPrice(
                          pricetypedata: widget.prodedit.pricetype![index],
                          onEditPrice: EditPrice,
                        ),
                      );
                    }),
              ),
            ),
            ElevatedButton(
                onPressed: _isDesButton
                    ? () {
                        //EditProduct();
                        var pdata = ProductsModel(
                            Id: widget.prodedit.Id,
                            title: contitle.text,
                            color: concolor.text,
                            brand: Brand(name: conbrand.text),
                            shipping: Shipping(
                                weigh: int.parse(conship_weight.text),
                                dimensions: Dimensions(
                                    width: int.parse(conship_dim_weight.text),
                                    height: int.parse(conship_dim_hight.text),
                                    depth: int.parse(conship_dim_depth.text))),
                            //shipping: ,
                            description: editdes ?? widget.prodedit.description,
                            pricetype: editprice ?? widget.prodedit.pricetype);
                        BlocProvider.of<ProductsBloc>(context)
                            .add(ProductUpdate(product: pdata));
                        //context.read<ProductsBloc>().add();
                      }
                    : null,
                child: Text('Edit Product'))
          ],
        ),
      ),
    );
  }
}

typedef OnEditDes(String newtext, String index);

class RenderDestrition extends StatefulWidget {
  //final GlobalKey<_CounterState> counterKey;
  const RenderDestrition(
      {required this.description,
      Key? key,
      // required this.counterKey,
      required this.onEditDes,
      required this.index,
      this.isButton})
      : super(key: key);
  final Description description;
  //final GlobalKey<_EditTestTwoState> counterKey;
  final OnEditDes onEditDes;
  final index;
  final isButton;
  @override
  RenderDestritionState createState() => RenderDestritionState();
}

class RenderDestritionState extends State<RenderDestrition> {
  late TextEditingController con_lang;
  late TextEditingController cont_details;
  List<Description>? editdata = [];
  late int ii;

  @override
  void initState() {
    ii = widget.index;
    con_lang = TextEditingController(text: widget.description.lang);
    con_lang.addListener(() => setState(() {}));
    cont_details = TextEditingController(text: widget.description.details);
    cont_details.addListener(() => setState(() {}));
    super.initState();
    //print(editdata!.first.details);
  }

  @override
  void dispose() {
    con_lang.dispose();
    cont_details.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.index.toString()),
        TextField(
          controller: con_lang,
          decoration: const InputDecoration(
            labelText: "lang",
            //border: OutlineInputBorder(),
          ),
        ),
        TextField(
          controller: cont_details,
          decoration: const InputDecoration(
            labelText: "Details:",
            //border: OutlineInputBorder(),
          ),
        ),
        ElevatedButton(
            onPressed: () =>
                {widget.onEditDes(cont_details.text, con_lang.text)},
            child: const Text('edit'))
      ],
    );
  }
}

typedef OnEditPrice(
    newlist, newsellprice, newbuyprice, newquantity, newsellquantity, findtext);

class RenderPrice extends StatefulWidget {
  const RenderPrice(
      {required this.pricetypedata, Key? key, required this.onEditPrice})
      : super(key: key);
  final Pricepackage pricetypedata;
  final OnEditPrice onEditPrice;
  @override
  RenderPriceState createState() => RenderPriceState();
}

class RenderPriceState extends State<RenderPrice> {
  //Student get student => widget.student;
  late TextEditingController con_pricepackage;
  late TextEditingController con_listprice;
  late TextEditingController cont_sell;
  late TextEditingController cont_buyprice;
  late TextEditingController cont_quantity;
  late TextEditingController cont_sellquantity;
  late TextEditingController cont_indate;

  @override
  void initState() {
    con_pricepackage = TextEditingController(
        text: widget.pricetypedata.pricepackagename != null
            ? widget.pricetypedata.pricepackagename.toString()
            : '');
    con_pricepackage.addListener(() => setState(() {}));
    con_listprice = TextEditingController(
        text: widget.pricetypedata.list != null
            ? widget.pricetypedata.list.toString()
            : '');
    con_listprice.addListener(() => setState(() {}));
    cont_sell =
        TextEditingController(text: widget.pricetypedata.sellprice.toString());
    cont_sell.addListener(() => setState(() {}));
    cont_buyprice = TextEditingController(
        text: widget.pricetypedata.buyprice != null
            ? widget.pricetypedata.buyprice.toString()
            : '');
    cont_buyprice.addListener(() => setState(() {}));
    cont_quantity = TextEditingController(
        text: widget.pricetypedata.quantity != null
            ? widget.pricetypedata.quantity.toString()
            : '');
    cont_quantity.addListener(() => setState(() {}));
    cont_sellquantity = TextEditingController(
        text: widget.pricetypedata.sellquantity != null
            ? widget.pricetypedata.sellquantity.toString()
            : '');
    cont_sellquantity.addListener(() => setState(() {}));
    cont_indate = TextEditingController(
        text: widget.pricetypedata.indate != null
            ? widget.pricetypedata.indate.toString()
            : '');
    cont_indate.addListener(() => setState(() {}));

    super.initState();
  }

  @override
  void dispose() {
    con_pricepackage.dispose();
    con_listprice.dispose();
    cont_sell.dispose();
    cont_buyprice.dispose();
    cont_quantity.dispose();
    cont_sellquantity.dispose();
    cont_indate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: con_pricepackage,
          decoration: const InputDecoration(
            labelText: "package",
            //border: OutlineInputBorder(),
          ),
        ),
        TextField(
          controller: con_listprice,
          decoration: const InputDecoration(
            labelText: "list price",
            //border: OutlineInputBorder(),
          ),
        ),
        TextField(
          controller: cont_sell,
          decoration: const InputDecoration(
            labelText: "sell price:",
            //border: OutlineInputBorder(),
          ),
        ),
        TextField(
          controller: cont_buyprice,
          decoration: const InputDecoration(
            labelText: "Buy price:",
            //border: OutlineInputBorder(),
          ),
        ),
        TextField(
          controller: cont_quantity,
          decoration: const InputDecoration(
            labelText: "quantity price:",
            //border: OutlineInputBorder(),
          ),
        ),
        TextField(
          controller: cont_sellquantity,
          decoration: const InputDecoration(
            labelText: "sell quantity:",
            //border: OutlineInputBorder(),
          ),
        ),
        TextField(
          controller: cont_indate,
          decoration: const InputDecoration(
            labelText: "input Date",
            //border: OutlineInputBorder(),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              widget.onEditPrice(
                  con_listprice.text,
                  cont_sell.text,
                  cont_buyprice.text,
                  cont_quantity.text,
                  cont_sellquantity.text,
                  con_pricepackage.text);
            },
            child: Text("Edit Price"))
      ],
    );
  }
}
