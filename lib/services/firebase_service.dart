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

Future<List> getGroming() async {
  List allGrooms = [];
  CollectionReference collectionReferenceGrooming = db.collection("grooming");
  QuerySnapshot queryGrooming = await collectionReferenceGrooming.get();

  for(var document in queryGrooming.docs){
    final Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    final groom = {
      'uid' : document.id,
      'dogId' : data['dog_id'],
      'date' : data['date'],
      'paymentType': data['payment_type']
    };
    allGrooms.add(groom);
  }

  return allGrooms;
}

//Save Person on db
Future<void> addPerson(String name, String tel, String tel2, String tel3, String ubi, String dob ) async {
  await db.collection('people').add(
    {
      "name": name,
      "tel": tel,
      "tel2": tel2,
      "tel3": tel3,
      "ubi": ubi,
      "dob": dob
    }
    );
}

//Update Person on db
Future<void> updatePerson(String uid, String name) async {
  await db.collection('people').doc(uid).update({"name": name});
}

//Delete Person on db
Future<void> deletePerson(String uid) async {
  await db.collection('people').doc(uid).delete();
}
