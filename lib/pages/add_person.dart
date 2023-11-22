import 'package:app/services/firebase_service.dart';
import 'package:flutter/material.dart';

class AddPersonPage extends StatefulWidget {
  const AddPersonPage({super.key});

  @override
  State<AddPersonPage> createState() => _AddPersonPageState();
}

class _AddPersonPageState extends State<AddPersonPage> {
  TextEditingController nameController = TextEditingController(text: "");

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
            ElevatedButton(
                onPressed: () async {
                  await addPerson(nameController.text).then((_) {
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
