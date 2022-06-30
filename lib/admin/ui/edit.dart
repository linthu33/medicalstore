import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ToDoElement {
  String task;
  final DateTime timeOfCreation;

  ToDoElement(this.task, this.timeOfCreation);
}

class MyEditForm extends StatefulWidget {
  const MyEditForm({Key? key}) : super(key: key);

  @override
  State<MyEditForm> createState() => _MyEditFormState();
}

class _MyEditFormState extends State<MyEditForm> {
  List<ToDoElement> _toDoItems = [];
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller1 = TextEditingController();

  void _addToDoItem(String task) {
    if (task.isNotEmpty) {
      setState(() {
        _toDoItems.add(ToDoElement(task, DateTime.now()));
      });
    }
  }

  void _editToDoItem(String newText, int index) {
    setState(() {
      _toDoItems[index].task = newText;
    });
  }

  void _removeTodoItem(int index) {
    setState(() => _toDoItems.removeAt(index));
  }

  _editDialog(BuildContext context, int index) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              padding: EdgeInsets.all(20),
              height: 180,
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 60,
                      child: TextField(
                        controller: _controller,
                        autofocus: true,
                        /*onSubmitted: (val) {
                      _addToDoItem(val);
                      _controller.clear();
                    },*/
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Add a task here...',
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            borderSide: BorderSide(color: Colors.red, width: 2),
                          ),
                        ),
                      )),
                  Container(
                    height: 65,
                    width: double.infinity,
                    margin: EdgeInsets.only(
                      top: 5,
                    ),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.red,
                      child: Text('EDIT', style: TextStyle(fontSize: 18)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      onPressed: () {
                        _editToDoItem(_controller.text, index);
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildToDoItem(String toDoText, int index) {
    return SizedBox(
      child: Container(
        height: 58,
        margin: EdgeInsets.only(
          left: 22.0,
          right: 22.0,
          bottom: 12,
        ),
        decoration: BoxDecoration(
          border: Border.all(width: 1.5, color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(18)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListTile(
                title: Text(
                  toDoText,
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () => null,
              ),
            ),
            FlatButton(
              child: Text(
                'Edit',
                style: TextStyle(color: Colors.red, fontSize: 16.5),
              ),
              onPressed: () => _editDialog(context, index),
            ),
            FlatButton(
              child: Text(
                'Delete',
                style: TextStyle(color: Colors.red, fontSize: 16.5),
              ),
              onPressed: () => _removeTodoItem(index),
            ),
          ],
        ),
      ),
    );
  }

  int compareElement(ToDoElement a, ToDoElement b) =>
      a.timeOfCreation.isAfter(b.timeOfCreation) ? -1 : 1;

  Widget _buildToDoList() {
    _toDoItems.sort(compareElement);
    return Expanded(
      child: ListView.builder(
        itemCount: _toDoItems.length,
        itemBuilder: (context, index) {
          if (index < _toDoItems.length) {
            return _buildToDoItem(_toDoItems[index].task, index);
          } else
            return Text("null");
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            centerTitle: true,
            backgroundColor: Colors.red,
            title: Text(
              'To Do List',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            height: 60,
            margin: EdgeInsets.all(22),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 10,
                  child: Container(
                    height: double.infinity,
                    child: TextField(
                      controller: _controller1,
                      autofocus: true,
                      onSubmitted: (val) {
                        _addToDoItem(val);
                        _controller1.clear();
                      },
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Add a task here...',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          borderSide: BorderSide(color: Colors.red, width: 2),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    height: double.infinity,
                    margin: EdgeInsets.only(left: 12),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.red,
                      child: Text('ADD', style: TextStyle(fontSize: 18)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      onPressed: () {
                        _addToDoItem(_controller1.text);
                        _controller1.clear();
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          _buildToDoList()
        ]),
      ),
    );
  }
}
