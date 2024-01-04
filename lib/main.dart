import 'package:app/pages/add_person.dart';
import 'package:app/pages/edit_person.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Discovery Pet',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/addPerson' : (context) => const AddPersonPage(),
        '/editPerson': (context) => const EditPersonPage(),
      },
    );
  }
}

