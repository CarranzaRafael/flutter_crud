import 'package:flutter/material.dart';
import 'package:app/services/firebase_service.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: FutureBuilder(
          future: getPeople(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    onDismissed: (direction) async {
                      await deletePerson(snapshot.data?[index]['uid']);
                      snapshot.data?.removeAt(index);
                    },
                    confirmDismiss: (direction) async {
                      bool result = false;
                      result = await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Quieres eliminar este registro?'),
                              actions: [
                                TextButton(
                                  onPressed: (){
                                  return Navigator.pop(
                                    context, false
                                    );
                                }, child: const Text('Cancelar', style: TextStyle(color: Colors.red),)),
                                TextButton(
                                  onPressed: (){
                                  return Navigator.pop(
                                    context, true
                                    );
                                }, child: const Text('Aceptar'))
                              ],
                            );
                          });
                      return result;
                    },
                    background: Container(
                      color: Colors.red,
                      child: const Icon(Icons.delete),
                    ),
                    key: Key(snapshot.data?[index]['uid']),
                    direction: DismissDirection.endToStart,
                    child: ListTile(
                      title: Text(snapshot.data?[index]['name']),
                      onTap: (() async {
                        await Navigator.pushNamed(context, '/editPerson',
                            arguments: {
                              "name": snapshot.data?[index]['name'],
                              "uid": snapshot.data?[index]['uid']
                            });
                        setState(() {});
                      }),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/addPerson');
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
