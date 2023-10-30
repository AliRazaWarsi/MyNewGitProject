import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class RealtimeDatabaseUpdate extends StatefulWidget {
  const RealtimeDatabaseUpdate({super.key});

  @override
  State<RealtimeDatabaseUpdate> createState() => _RealtimeDatabaseUpdateState();
}

class _RealtimeDatabaseUpdateState extends State<RealtimeDatabaseUpdate> {
  final DatabaseReference databaseRef =
      FirebaseDatabase.instance.ref().child('testdb');
  @override
  Widget build(BuildContext context) {
    /*  return Scaffold(
        body: SafeArea(
      child: FirebaseAnimatedList(
          query: databaseRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            final name = snapshot.value['name'] as String? ?? '';
            final city = snapshot.value['city'] as String? ?? '';

            return ListTile(
              subtitle: Text(name),
              title: Text(city),
            );
          }),
    )
    );
    */
    return Scaffold(
      body: SafeArea(
        child: FirebaseAnimatedList(
          query: databaseRef,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            if (snapshot.value is Map) {
              final Map<dynamic, dynamic> dataMap =
                  snapshot.value as Map<dynamic, dynamic>;
              final String name = dataMap['name'] as String? ?? '';
              final String city = dataMap['city'] as String? ?? '';
              final String age = dataMap['age'] as String? ?? '';

              return ListTile(
                subtitle: Text(name),
                title: Text(city + "\t" + age),
                trailing: IconButton(
                  onPressed: () {
                    //var keyFider = snapshot.key;
                    //print(keyFider);
                    updateDialog(snapshot.value['name'], snapshot.value['city'],
                        context);
                  },
                  icon: Icon(Icons.edit),
                ),
              );
            } else {
              // Handle if the data is not in the expected format
              return const ListTile(
                subtitle: Text('Data Format Error'),
                title: Text('Data Format Error'),
              );
            }
          },
        ),
      ),
    );
  }

  Future<void> updateDialog(String name, String city, BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Update Value"),
            content: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(), labelText: "Name"),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(), labelText: "city"),
                ),
              ],
            ),
            actions: [
              TextButton(onPressed: () {}, child: Text("Update")),
              TextButton(onPressed: () {}, child: Text("Cancel")),
            ],
          );
        });
  }
}
