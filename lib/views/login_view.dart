import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;
import '../firebase_options.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
      appBar: AppBar(title: const Text('Login View')),
      body: Column(
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
              hintText: 'Enter Your Password Here.',
            ),
          ),
          TextButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;

              try {
                //  final userCredentials =
                await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: email,
                  password: password,
                );
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/notes/', (route) => false);
                // devtools.log(userCredentials.toString());
                //  print(userCredentials);
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  devtools.log('User not found');
                } else if (e.code == 'weak-password') {
                  devtools.log('Weak Password');
                } else if (e.code == 'email-already-in-use') {
                  devtools.log('Email is already in use. try a different one');
                } else if (e.code == 'invalid-email') {
                  devtools.log('Invalid email is entered!');
                }
                // print('Something bad happened');
                // print(e.runtimeType);
                // print(e);
              }
            },
            child: const Text('Login'),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/register/', (route) => false);
              },
              child: const Text('Not registered yet? Register here')),
        ],
      ),
    );

    /* return  Scaffold(
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
                         default:
              return const Text('Please wait. Your View is Loading.....');
          }
        },
      ),
    );
  */
  }
}
