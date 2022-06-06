import 'package:flutter/material.dart';
import 'package:mystore/admin/models/ProductsModel.dart';
import 'package:mystore/admin/ui/add_produt.dart';
import 'package:mystore/admin/ui/form.dart';

import '../models/listdesctiprionModel.dart';

class MultiForm extends StatefulWidget {
  @override
  _MultiFormState createState() => _MultiFormState();
}

class _MultiFormState extends State<MultiForm> {
  List<UserForm> users = []; //ui for description
  //late String title;
  ProductsModel prodmodel = new ProductsModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: .0,
        leading: Icon(
          Icons.wb_cloudy,
        ),
        title: Text('REGISTER USERS'),
        actions: <Widget>[
          FlatButton(
            child: Text('Save'),
            textColor: Colors.white,
            onPressed: onSave,
          )
        ],
      ),
      body: Column(children: [
        Container(
          child: users.length <= 0
            ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: ProductForm(
              key: GlobalKey(),
              prodmodel: prodmodel,
          ),
                ),
            )
            : Expanded(
              child: ListView.builder(
                  addAutomaticKeepAlives: true,
                  itemCount: users.length,
                  itemBuilder: (_, i) => users[i],
                ),
            ),
        ),
      
        ElevatedButton(
          child: Icon(Icons.add),
          onPressed: onAddForm,
          //foregroundColor: Colors.white,
        ),
      ]),
    );
  }

  ///on form user deleted
  void onDelete(ListDescription _user) {
    setState(() {
      var find = users.firstWhere((it) => it.description == _user);
      if (find != null) users.removeAt(users.indexOf(find));
    });
  }

  ///on add form
  void onAddForm() {
    setState(() {
      var _user = ListDescription();
      users.add(UserForm(
        description: _user,
        onDelete: () => onDelete(_user),
        key: GlobalKey(),
      ));
    });
  }

  ///on save forms
  void onSave() {
    print('------------------');
    //prodmodel.title=GlobalKey().currentContext.fi
    print(prodmodel.title.toString());
    if (users.length > 0) {
      var allValid = true;
      users.forEach((form) => allValid = allValid && form.isValid());
      if (allValid) {
        var data = users.map((it) => it.description).toList();
        print(data);
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
