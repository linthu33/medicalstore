import 'package:flutter/material.dart';
import 'package:mystore/admin/models/ProductsModel.dart';

class EditTestTwo extends StatefulWidget {
  final ProductsModel prodedit;
  const EditTestTwo({Key? key, required this.prodedit}) : super(key: key);

  @override
  State<EditTestTwo> createState() => _EditTestTwoState();
}

class _EditTestTwoState extends State<EditTestTwo> {
  final List<TextEditingController> _controller = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.prodedit.description!.length; i++) {
      _controller.addAll([
        TextEditingController(
            text: widget.prodedit.description![i].lang.toString()),
        /* TextEditingController(
            text: widget.prodedit.description![i].details.toString()) */
      ]);
    }
    //controller=
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: widget.prodedit.description!.length,
          itemBuilder: (BuildContext context, int index) {
            //_controller.add(TextEditingController());
            /*  if (widget.prodedit.description!.isEmpty) {
              return CircularProgressIndicator();
            } else {
              return singleItemList(index, _controller[index]);
            } */

            return Column(
              children: [
                Text(
                    'lang ${widget.prodedit.description![index].lang.toString()}'),
                Text(
                    'details ${widget.prodedit.description![index].details.toString()}'),
                TextField(
                  textAlign: TextAlign.start,
                  controller: _controller[index],
                  /* ..text =
                        widget.prodedit.description![index].lang.toString(), */
                  keyboardType: TextInputType.text,
                ),
                TextField(
                  textAlign: TextAlign.start,
                  controller: _controller[index],
                  /* ..text =
                        widget.prodedit.description![index].details.toString(), */
                  keyboardType: TextInputType.text,
                ),
              ],
            );
          }),
    );
  }

  Widget singleItemList(int index, TextEditingController controllertxt) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          Text('lang ${widget.prodedit.description![index].lang.toString()}'),
          Text(
              'details ${widget.prodedit.description![index].details.toString()}'),
          Expanded(flex: 1, child: Text("${index + 1}")),
          Expanded(
            flex: 3,
            child: TextField(
              controller: controllertxt
                ..text = widget.prodedit.description![index].lang.toString(),
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: "Qty",
              ),
            ),
          ),
          Expanded(flex: 1, child: Text("${index + 1}")),
          Expanded(
            flex: 3,
            child: TextField(
              controller: controllertxt
                ..text = widget.prodedit.description![index].details.toString(),
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: "Qty",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
