import 'package:flutter/material.dart';

class Student {
  int id;
  String name;
  Student(this.id, this.name);
}

class Class {
  String name;
  List<Student> students;
  Class(this.name, [this.students = const []]);
}

class RenderStudent extends StatefulWidget {
  const RenderStudent({required this.student, Key? key}) : super(key: key);
  final Student student;

  @override
  RenderStudentState createState() => RenderStudentState();
}

class RenderStudentState extends State<RenderStudent> {
  Student get student => widget.student;

  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: widget.student.name);
    controller.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: "Student id: ${student.id}",
        border: const OutlineInputBorder(),
      ),
    );
  }
}

class RenderClass extends StatelessWidget {
  const RenderClass({required this.clas, Key? key}) : super(key: key);
  final Class clas;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Class ${clas.name}", style: const TextStyle(fontSize: 40)),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: clas.students.length,
            itemBuilder: (context, i) => Padding(
              padding: const EdgeInsets.all(4),
              child: RenderStudent(
                student: clas.students[i],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
