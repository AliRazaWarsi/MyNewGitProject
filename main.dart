//import 'dart:async';
//import 'dart:js_interop';
//import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_db_connection/realtime_db/display.dart';
import 'package:flutter_app_db_connection/realtime_db/insert.dart';
import 'package:flutter_app_db_connection/realtime_db/update.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //   DatabaseReference ref = FirebaseDatabase.instance.ref("testdb");

    //   final reference = FirebaseDatabase.instance.reference().child('testdb');

    /*  // Replace with your Firebase Realtime Database URL
    final reference = FirebaseDatabase.instance.reference().child('testdb');

    // Hardcoded data to be added to the database
    Map<String, dynamic> data = {
      'name': 'John Doe',
      'email': 'johndoe@email.com',
      'age': 30,
    };

    // Add the data to the database
    reference.push().set(data);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Firebase Database Example'),
        ),
        body: Center(
          child: Text('Data added to Firebase Database'),
        ),
      ),
    );
*/
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'flutter firebase realtime db demo')
        //home: const RealtimeDatabaseInsert()
        //home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );

    // return MaterialApp(
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: const Text('Firebase Database Example'),
    //     ),
    //     body: const Center(
    //       child: Text('Check the console for Firebase data'),

    //     ),
    //   ),
    // );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //final DatabaseReference databaseRef = FirebaseDatabase.instance.ref('testdb');
  // final _databaseReference =
  //    FirebaseDatabase.instance.reference().child('testdb');

//   void getData() {
//   databaseRef.once().then((DataSnapshot snapshot) {
//     if (snapshot.value != null) {
//       Map<dynamic, dynamic> values = snapshot.value;
//       values.forEach((key, value) {
//         if (value is Map<String, dynamic> && value.containsKey("ScannedItem")) {
//           print(value["ScannedItem"]);
//         }
//       });
//     } else {
//       print("No data found.");
//     }
//   } as FutureOr Function(DatabaseEvent value));
// }

  // DatabaseReference ref = FirebaseDatabase.instance.ref("testdb");

  /* void getData() async {
    Query query = ref.orderByChild("age").limitToFirst(10);

    DataSnapshot event = await query.get();
    print(event);
  }
  */

  /* @override
  void initState() async {
    print('inside init');
    super.initState();
    getData();
*/

  // final ref = FirebaseDatabase.instance.ref();
  // final snapshot = await ref.child('testdb').get();

  // if (snapshot.exists) {
  //   print(snapshot.value);
  // } else {
  //   print('No data available.');
  // }

  // Read data from the Firebase Realtime Database
  // _databaseReference.once().then(( DataSnapshot snapshot) {
  //   Map<dynamic, dynamic> values =  snapshot.value;
  //   print("Data from Firebase: $values");
  // } as FutureOr Function(DatabaseEvent value));

  // DatabaseReference ref = FirebaseDatabase.instance.ref('testdb');
  // DatabaseEvent event = await ref.once();
  // log('trying to print db data' as num);
  // print(event.snapshot.value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Text(
                'RealTime Firebase database',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 15,
              ),
              allButton("Insert Data", RealtimeDatabaseInsert()),
              const SizedBox(
                height: 15,
              ),
              allButton("Display Data", RealtimeDatabaseDisplay()),
              const SizedBox(
                height: 15,
              ),
              allButton("Update Data", RealtimeDatabaseUpdate()),
            ],
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return const Scaffold(
  //     body: SafeArea(
  //       child: Text(
  //         'welcome all',
  //         style: TextStyle(fontSize: 30),
  //       ),
  //     ),
  //   );
  // }

  Widget allButton(String text, var pageName) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => pageName),
          );
        },
        child: Text(
          text,
          style: TextStyle(color: Colors.black),
        ));
  }
}
