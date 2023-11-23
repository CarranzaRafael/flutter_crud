import 'package:flutter/material.dart';
import 'package:app/services/firebase_service.dart';

class EditPersonPage extends StatefulWidget {
  const EditPersonPage({super.key});

  @override
  State<EditPersonPage> createState() => _EditPersonPageState();
}

class _EditPersonPageState extends State<EditPersonPage> {
  TextEditingController nameController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    nameController.text = arguments['name'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: 'Editar Nombre'),
            ),
            ElevatedButton(
                onPressed: () async {
                  await updatePerson(arguments['uid'], nameController.text)
                      .then((_) => {
                            Navigator.pop(context),
                          });
                },
                child: const Text('Actualizar'))
          ],
        ),
      ),
    );
  }
}
