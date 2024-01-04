import 'package:app/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddPersonPage extends StatefulWidget {
  const AddPersonPage({super.key});

  @override
  State<AddPersonPage> createState() => _AddPersonPageState();
}

class _AddPersonPageState extends State<AddPersonPage> {
  //uno de estos por cada campo en el form

  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController telController = TextEditingController(text: "");
  TextEditingController tel2Controller = TextEditingController(text: "");
  TextEditingController tel3Controller = TextEditingController(text: "");
  TextEditingController ubiController = TextEditingController(text: "");
  TextEditingController dobController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Persona'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: 'Agregar Nombre'),
            ),
            TextField(
              controller: telController,
              decoration: const InputDecoration(hintText: 'Numero de contacto'),
            ),
            TextField(
              controller: tel2Controller,
              decoration: const InputDecoration(hintText: 'Otro Numero de contacto'),
            ),
            TextField(
              controller: tel3Controller,
              decoration: const InputDecoration(hintText: 'Otro Numero de contacto'),
            ),
            TextField(
              controller: ubiController,
              decoration: const InputDecoration(hintText: 'Direccion de residencia'),
            ),
            TextField(
              controller: dobController,
              decoration: const InputDecoration(hintText: 'Cumplea;os'),
            ),
            ElevatedButton(
                onPressed: () async {
                  await addPerson(nameController.text, telController.text, tel2Controller.text, tel3Controller.text, ubiController.text, dobController.text ).then((_) {
                    Navigator.pop(context);
                  });
                },
                child: const Text('Guardar'))
          ],
        ),
      ),
    );
  }
}
