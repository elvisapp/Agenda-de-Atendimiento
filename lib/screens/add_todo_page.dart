import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({Key key}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  String type = "";
  String category = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xff1d1e26),
            Color(0xff252041),
          ]),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    CupertinoIcons.arrow_left,
                    color: Colors.white,
                    size: 28,
                  )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Criar",
                      style: TextStyle(
                        fontSize: 33,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "Nova Agenda",
                      style: TextStyle(
                        fontSize: 33,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    labels("Titulo"),
                    const SizedBox(
                      height: 25,
                    ),
                    title(),
                    const SizedBox(
                      height: 30,
                    ),
                    labels("Tipo de Agenda"),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        taskSelect("İmportante", 0xff2664fa),
                        const SizedBox(width: 20),
                        taskSelect("Pendiente", 0xff2bc8d9),
                      ],
                    ),
                    const SizedBox(height: 25),
                    labels("Descrição"),
                    const SizedBox(height: 10),
                    description(),
                    SizedBox(height: 10),
                    labels("Categoria"),
                    SizedBox(height: 10),
                    Column(
                      children: [
                        Row(
                          children: [
                            categorySelect("Compras", 0xFFF03B38),
                            const SizedBox(width: 20),
                            categorySelect("Rapida", 0xFFD46306),
                            const SizedBox(width: 20),
                            categorySelect("Trabalho", 0xFF733886),
                          ],
                        ),
                        Row(
                          children: [
                            categorySelect("Ligar", 0xFF0A3495),
                            const SizedBox(width: 20),
                            categorySelect("Correria", 0xff2bc8d9),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    button("Criar Agenda"),
                    // const SizedBox(height: 10),
                    // button("Read Todo"),
                    // const SizedBox(height: 10),
                    // button("Update Todo"),
                    // const SizedBox(height: 10),
                    // button("Delete Todo"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget title() {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color(0xff2a2e3d),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextFormField(
        controller: _titleController,
        decoration: const InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: "Tipo de Agenda",
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 16.7,
            ),
            contentPadding: EdgeInsets.only(
              left: 20,
              right: 20,
            )),
      ),
    );
  }

  Widget button(String name) {
    return InkWell(
      onTap: () {
        FirebaseFirestore.instance.collection("Todo").add({
          "title": _titleController.text,
          "task": type,
          "category": category,
          "description": _descriptionController.text,
        }).then((value) => Navigator.pop(context));
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(colors: [
            Color(0xff8a32f1),
            Color(0xffad32f9),
          ]),
        ),
        child: Center(
            child: Text(
          name,
          style: const TextStyle(color: Colors.white),
        )),
      ),
    );
  }

  Widget description() {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color(0xff2a2e3d),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextFormField(
        controller: _descriptionController,
        maxLines: null,
        decoration: const InputDecoration(
            hintText: "Descrição",
            fillColor: Colors.white,
            filled: true,
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 31, 20, 20),
              fontSize: 16.7,
            ),
            contentPadding: EdgeInsets.only(
              left: 20,
              right: 20,
            )),
      ),
    );
  }

  Widget taskSelect(String name, int color) {
    return InkWell(
      onTap: () {
        //tasking checked
        setState(() {
          type = name;
        });
      },
      child: Chip(
        backgroundColor: type == name ? Colors.green : Color(color),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        label: Text(
          name,
        ),
        labelStyle: TextStyle(
          fontSize: 17,
          color: type == name ? Colors.black : Colors.white,
        ),
      ),
    );
  }

  Widget categorySelect(String name, int color) {
    return InkWell(
      onTap: () {
        //category checked
        setState(() {
          category = name;
        });
      },
      child: Chip(
        backgroundColor: category == name ? Colors.green : Color(color),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        label: Text(
          name,
        ),
        labelStyle: TextStyle(
          fontSize: 17,
          color: category == name ? Colors.black : Colors.white,
        ),
      ),
    );
  }

  Widget labels(String name) {
    return Container(
      child: Text(
        name,
        style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2),
      ),
    );
  }
}
