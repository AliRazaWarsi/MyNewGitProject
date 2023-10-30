/* 
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RealtimeDatabaseDisplay extends StatefulWidget {
  const RealtimeDatabaseDisplay({super.key});

  @override
  State<RealtimeDatabaseDisplay> createState() =>
      _RealtimeDatabaseDisplayState();
}

class _RealtimeDatabaseDisplayState extends State<RealtimeDatabaseDisplay> {
  final databaseRef = FirebaseDatabase.instance.ref(). child("testdb");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FirebaseAnimatedList(
              query: databaseRef,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                // var x = snapshot.value['name'];
                // print(x);
                return ListTile(
                  
                  subtitle: Text(snapshot.value['name']),
                  title: Text(snapshot.value['city']),

                );
                //Text('data');
              })
          //Text("Display Realtime database Data"),
          ),
    );
  }
}
*/

/*
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class RealtimeDatabaseDisplay extends StatefulWidget {
  const RealtimeDatabaseDisplay({Key? key}) : super(key: key);

  @override
  State<RealtimeDatabaseDisplay> createState() =>
      _RealtimeDatabaseDisplayState();
}

class _RealtimeDatabaseDisplayState extends State<RealtimeDatabaseDisplay> {
  final databaseRef = FirebaseDatabase.instance.reference().child("testdb");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Realtime Database Display'),
      ),
      body: SafeArea(
        child: FirebaseAnimatedList(
          query: databaseRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            final value = snapshot.value as Map<dynamic, dynamic>;
            if (value != null) {
              final name = value['name'] ?? '';
              final city = value['city'] ?? '';

              return ListTile(
                title: Text(name),
                subtitle: Text(city),
              );
            } else {
              // Handle if the data is missing or not in the expected format.
              return const ListTile(
                title:  Text('Data Missing'),
              );
            }
          },
        ),
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    home: RealtimeDatabaseDisplay(),
  ));
}
*/

/*
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class RealtimeDatabaseDisplay extends StatefulWidget {
  const RealtimeDatabaseDisplay({Key? key}) : super(key: key);

  @override
  State<RealtimeDatabaseDisplay> createState() =>
      _RealtimeDatabaseDisplayState();
}

class _RealtimeDatabaseDisplayState extends State<RealtimeDatabaseDisplay> {
  final databaseRef = FirebaseDatabase.instance.reference().child("testdb");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Realtime Database Display'),
      ),
      body: SafeArea(
        child: FirebaseAnimatedList(
          query: databaseRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            if (snapshot.value is Map<dynamic, dynamic>) {
              final value = snapshot.value as Map<dynamic, dynamic>;
              final name = value['name'] ?? '';
              final city = value['city'] ?? '';
              final age = value['age'] ?? '';

              return ListTile(
                title: Text(name),
                subtitle: Text(city),
              );
            } else {
              // Handle if the data is not in the expected format.
              return const ListTile(
                title: Text('Data Missing'),
              );
            }
          },
        ),
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    home: RealtimeDatabaseDisplay(),
  ));
}
*/

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RealtimeDatabaseDisplay extends StatefulWidget {
  const RealtimeDatabaseDisplay({Key? key}) : super(key: key);

  @override
  State<RealtimeDatabaseDisplay> createState() =>
      _RealtimeDatabaseDisplayState();
}

class _RealtimeDatabaseDisplayState extends State<RealtimeDatabaseDisplay> {
  // final databaseRef = FirebaseDatabase.instance.reference().child("testdb");

  final databaseRef = FirebaseDatabase.instance.ref().child("testdb");
  List<Map<dynamic, dynamic>> dataList = [];

  @override
  void initState() {
    super.initState();
    // Fetch data from the Firebase Realtime Database when the widget is initialized.
    databaseRef.onValue.listen((event) {
      if (event.snapshot.value != null && event.snapshot.value is Map) {
        setState(() {
          dataList.clear();
          Map<dynamic, dynamic> dataMap =
              event.snapshot.value as Map<dynamic, dynamic>;
          dataMap.forEach((key, value) {
            if (value is Map) {
              dataList.add(value);
            }
          });
        });
      }
    });
  }

/*  @override
  void initState() {
    super.initState();
    // Fetch data from the Firebase Realtime Database when the widget is initialized.
    databaseRef.onValue.listen((event) {
      if (event.snapshot.value != null) {
        setState(() {
          dataList.clear();
          event.snapshot.value.forEach((key, value) {
            dataList.add(value);
          });
        });
      }
    });
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Realtime Database Display'),
      ),
      body: SafeArea(
        child: dataList.isEmpty
            ? const Center(
                child: CircularProgressIndicator()) // Loading indicator
            : ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  final data = dataList[index];
                  final name = data['name'] as String;
                  final age = data['age'] as String;
                  final city = data['city'] as String;

                  return ListTile(
                    title: Text('Name: $name'),
                    subtitle: Text('Age: $age'),
                    trailing: Text('City: $city'),
                  );
                },
              ),
      ),
    );
  }

/*  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Realtime Database Display'),
      ),
      body: SafeArea(
        child: dataList.isEmpty
            ? Center(child: CircularProgressIndicator()) // Loading indicator
            : ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  final data = dataList[index];
                  final name = data['name'] as String;
                  final age = data['age'] as int;
                  final city = data['city'] as String;

                  return ListTile(
                    title: Text('Name: $name'),
                    subtitle: Text('Age: $age'),
                    trailing: Text('City: $city'),
                  );
                },
              ),
      ),
    );
*/
  /* body: SafeArea(
        child: StreamBuilder(
          stream: databaseRef.onValue,
          builder:
              (BuildContext context, AsyncSnapshot<DatabaseEvent> snapshot) {
            if (snapshot.hasData) {
              final DataSnapshot data = snapshot.data!.snapshot;
              final Map<dynamic, dynamic>? values =
                  data.value as Map<dynamic, dynamic>?;

              if (values != null) {
                final name = values['name'] as String? ?? '';
                final age = values['age'] as int? ?? 0;
                final city = values['city'] as String? ?? '';

                return ListTile(
                  title: Text('Name: $name'),
                  subtitle: Text('Age: $age'),
                  trailing: Text('City: $city'),
                );
              }
            }

            // Handle if data is missing or not in the expected format.
            return const ListTile(
              title: Text('Data Missing'),
            );
          },
        ),
      ),
    */
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    home: RealtimeDatabaseDisplay(),
  ));
}
