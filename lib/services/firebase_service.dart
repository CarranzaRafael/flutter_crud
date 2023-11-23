import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

//Get people from db
Future<List> getPeople() async {
  List people = [];
  CollectionReference collectionReferencePeople = db.collection('people');

  QuerySnapshot queryPeople = await collectionReferencePeople.get();

  for (var document in queryPeople.docs) { 
    //es una lista no un array, tons es add no push
    final Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    final person = {
      "uid" : document.id,
      "name" : data['name'],
    };
    people.add(person);
  }

  return people;
}

//Save Person on db
Future<void> addPerson(String name) async {
  await db.collection('people').add({"name": name});
}

//Update Person on db
Future<void> updatePerson(String uid, String name) async {
  await db.collection('people').doc(uid).update({"name": name});
}

//Delete Person on db
Future<void> deletePerson(String uid) async {
  await db.collection('people').doc(uid).delete();
}
