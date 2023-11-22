import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

//Get people from db
Future<List> getPeople() async {
  List people = [];
  CollectionReference collectionReferencePeople = db.collection('people');

  QuerySnapshot queryPeople = await collectionReferencePeople.get();

  for (var document in queryPeople.docs) { 
    //es una lista no un array, tons es add no push
    people.add(document.data());
  }

  return people;
}

//Save Person on db
Future<void> addPerson(String name) async {
  await db.collection('people').add({"name": name});
}
