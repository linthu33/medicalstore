import 'package:flutter/material.dart';
import 'package:mystore/admin/models/ProductsModel.dart';

class EditTestTwo extends StatefulWidget {
  EditTestTwo({Key? key, required this.prodedit}) : super(key: key);
  final ProductsModel prodedit;
  final GlobalKey<_EditTestTwoState> key = GlobalKey();
  @override
  State<EditTestTwo> createState() => _EditTestTwoState();
}

class _EditTestTwoState extends State<EditTestTwo> {
  @override
  void initState() {
    super.initState();
  }

  void EditProduct() {
    /*  var pdata=ProductsModel(
      
    ) */
    //print(widget.prodedit.toJson(widget.prodedit));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            margin: EdgeInsets.all(20),
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.green, width: 1)),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: widget.prodedit.description!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(4),
                    child: RenderDestrition(
                      description: widget.prodedit.description![index],
                    ),
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
                    ),
                  );
                }),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              EditProduct();
            },
            child: Text('Edit Product'))
      ],
    );
  }
}

class RenderDestrition extends StatefulWidget {
  const RenderDestrition({required this.description, Key? key})
      : super(key: key);
  final Description description;

  @override
  RenderDestritionState createState() => RenderDestritionState();
}

class RenderDestritionState extends State<RenderDestrition> {
  //Student get student => widget.student;

  late TextEditingController con_lang;
  late TextEditingController cont_details;

  @override
  void initState() {
    con_lang = TextEditingController(text: widget.description.lang);
    con_lang.addListener(() => setState(() {}));
    cont_details = TextEditingController(text: widget.description.details);
    cont_details.addListener(() => setState(() {}));
    super.initState();
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
      ],
    );
  }
}

class RenderPrice extends StatefulWidget {
  const RenderPrice({required this.pricetypedata, Key? key}) : super(key: key);
  final Pricepackage pricetypedata;

  @override
  RenderPriceState createState() => RenderPriceState();
}

class RenderPriceState extends State<RenderPrice> {
  //Student get student => widget.student;

  late TextEditingController con_listprice;
  late TextEditingController cont_sell;
  late TextEditingController cont_buyprice;
  late TextEditingController cont_quantity;
  late TextEditingController cont_sellquantity;
  late TextEditingController cont_indate;

  @override
  void initState() {
    con_listprice = TextEditingController(
        text: widget.pricetypedata.list != null
            ? widget.pricetypedata.list.toString()
            : '');
    con_listprice.addListener(() => setState(() {}));
    cont_sell =
        TextEditingController(text: widget.pricetypedata.sellprice.toString());
    cont_sell.addListener(() => setState(() {}));

    super.initState();
  }

  @override
  void dispose() {
    con_listprice.dispose();
    cont_sell.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
