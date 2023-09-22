import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../firebase_options.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  //int _counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    _email = TextEditingController();
    _password = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _email.dispose();
    _password.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter firebase testing'),
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Column(
                children: [
                  TextField(
                     controller: _email,
                    obscureText: false,
                    enableSuggestions: true,
                    autocorrect: false,
                    //  keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Enter Your Email Address Here',
                    ),
                  ),
                  TextField(
                    controller: _password,
                    obscureText: true,
                    // enableSuggestions: true ,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      hintText: 'Enter Your Password Here',
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      final email = _email.text;
                      final password = _password.text;

                      try {
                        final userCredentials = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: email,
                          password: password,
                        );
                        //  print(userCredentials);
                      } on FirebaseAuthException catch (e) {
                        if(e.code == 'user-not-found'){
                          print('User not found');
                        }
                        else if(e.code == 'weak-password'){
                          print('Weak Password');
                        }
                        else if(e.code == 'email-already-in-use'){
                          print('Email is already in use. try a different one');
                        }
                        else if(e.code == 'invalid-email'){
                          print('Invalid email is entered!');
                        }
                       // print('Something bad happened');
                       // print(e.runtimeType);
                       // print(e); 
                      }
                    },
                    child: const Text('Register'),
                  ),
                ],
              );
            default:
              return const Text('Please wait. Your View is Loading.....');
          }
        },
      ),
    );
  }
}