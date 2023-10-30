/*import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RealtimeDatabaseInsert extends StatefulWidget {
  const RealtimeDatabaseInsert({super.key});

  @override
  State<RealtimeDatabaseInsert> createState() => _RealtimeDatabaseInsertState();
}

class _RealtimeDatabaseInsertState extends State<RealtimeDatabaseInsert> {
  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var cityController = TextEditingController();

  final databaseRef = FirebaseDatabase.instance.ref('https://console.firebase.google.com/project/flutterdbconnection/database/flutterdbconnection-default-rtdb/data/~2F');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Text(
            'insert Data',
            style: TextStyle(fontSize: 28),
          ),
          const SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
                labelText: 'name', border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: ageController,
            decoration: const InputDecoration(
                labelText: 'age', border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: cityController,
            decoration: const InputDecoration(
                labelText: 'city', border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton(
            onPressed: () {
             
              var name = nameController.text;
              var age = ageController.text;
              var city = cityController.text;

              if (name.isNotEmpty && age.isNotEmpty && city.isNotEmpty) {
                databaseRef.child('testdb').set({
                  'name': name,
                  'age': age,
                  'city': city,
                });
                 printText(nameController, ageController, cityController);

              }

              //   var name = nameController.value;
              //   var age = ageController.value;
              //   var city = cityController.value;

              //  // if (name.isNotEmpty && age.isNotEmpty && city.isNotEmpty) {
              //     databaseRef.child('testdb').set({
              //       'name': name,
              //       'age': age,
              //       'city': city,
              //     });
              //  // }

              // var name = nameController;
              // var age = ageController;
              // var city = cityController;

              // try {
              //   print(city);
              //   databaseRef.child('testdb').set({
              //     'name': name, //nameController.text,
              //     'age': age, //ageController.text,
              //     'city': city, //cityController.text
              //   });
              // } catch (error) {
              //   log("Error: $error" as num);
              // }

              // databaseRef.child('testdb').set({
              //   'name': nameController.text.toString(),
              //   'age': ageController.text.toString(),
              //   'city': cityController.text.toString(),
              // });

              /*  if (nameController.text.isNotEmpty &&
                  ageController.text.isNotEmpty &&
                  cityController.text.isNotEmpty) {
                insertData(nameController.text, ageController.text,
                    cityController.text);
              }
              */
            },
            child: const Text('Add', style: TextStyle(fontSize: 18)),
          ),
        ],
      )),
    );
  }

  void insertData(String name, String age, String city) {
    print('insert data called');
    databaseRef.push().set({
      'name': name,
      'age': age,
      'city': city,
    });
    nameController.clear();
    ageController.clear();
    cityController.clear();
  }

  // void insertData(String name, String age, String city) {
  //   print('insert data called');
  //   databaseRef.child("testbd").set({
  //     'name': nameController.text.toString(),
  //     'age': ageController.text.toString(),
  //     'city': cityController.text.toString(),
  //   });
  //   nameController.clear();
  //   ageController.clear();
  //   cityController.clear();
  // }
}

void printText(nameController, ageController, cityController) {
  print(nameController);
  print(ageController);
  print(cityController);
}
*/

/*
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RealtimeDatabaseInsert extends StatefulWidget {
  const RealtimeDatabaseInsert({super.key});

  @override
  State<RealtimeDatabaseInsert> createState() => _RealtimeDatabaseInsertState();
}

class _RealtimeDatabaseInsertState extends State<RealtimeDatabaseInsert> {
  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var cityController = TextEditingController();

  final databaseRef = FirebaseDatabase.instance.ref().child('testdb');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text(
              'Insert Data',
              style: TextStyle(fontSize: 28),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: ageController,
              decoration: const InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: cityController,
              decoration: const InputDecoration(
                labelText: 'City',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton(
              onPressed: () {
                var name = nameController.text;
                var age = ageController.text;
                var city = cityController.text;

                if (name.isNotEmpty && age.isNotEmpty && city.isNotEmpty) {
                  databaseRef.push().set({
                    'name': name,
                    'age': age,
                    'city': city,
                  });
                }
              },
              child: const Text('Add', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
*/

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RealtimeDatabaseInsert extends StatefulWidget {
  const RealtimeDatabaseInsert({super.key});

  @override
  State<RealtimeDatabaseInsert> createState() => _RealtimeDatabaseInsertState();
}

class _RealtimeDatabaseInsertState extends State<RealtimeDatabaseInsert> {
  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var cityController = TextEditingController();

  final databaseRef = FirebaseDatabase.instance.ref().child('testdb');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Realtime Database Insertion'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Text(
              'Insert Data',
              style: TextStyle(fontSize: 28),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: ageController,
              decoration: const InputDecoration(
                labelText: 'age',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: cityController,
              decoration: const InputDecoration(
                labelText: 'city',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton(
              onPressed: () {
                addDataToFirebase();
                /* var name = nameController.text;
                var age = ageController.text;
                var city = cityController.text;

                if (name.isNotEmpty && age.isNotEmpty && city.isNotEmpty) {
                  databaseRef.set({
                    'name': name,
                    'age': age,
                    'city': city,
                  });
                  printText(nameController, ageController, cityController);
                }*/
              },
              child: const Text('Add', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  void insertData(String name, String age, String city) {
    print('InsertData() is called');
    databaseRef.push().set({
      'name': name,
      'age': age,
      'city': city,
    });
    nameController.clear();
    ageController.clear();
    cityController.clear();
  }

  void addDataToFirebase() {
    final DatabaseReference databaseRef =
        FirebaseDatabase.instance.ref().child("testdb");

    Map<String, dynamic> RuntimeData = {
      "name": nameController.text,
      "age": ageController.text
          .toString(), //int.tryParse(ageController.text) ?? 0,
      "city": cityController.text,
    };

    // Push the data to Firebase
    DatabaseReference newRecordRef = databaseRef.push();
    newRecordRef.set(RuntimeData);
    // Clear the form fields after submission
    nameController.clear();
    ageController.clear();
    cityController.clear();
  }
}
