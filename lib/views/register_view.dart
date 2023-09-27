import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_testingfirebase/routes.dart';
import 'package:flutter_application_testingfirebase/views/login_view.dart';
//import 'dart:developer' as devtools show log;
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
        title: const Text('Register'),
      ),
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
              hintText: 'Enter Your Password Here',
            ),
          ),
          TextButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;

              try {
                //   final userCredentials =
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: email,
                  password: password,
                );
                //
                //
                final user = FirebaseAuth.instance.currentUser;
                await user?.sendEmailVerification();
                Navigator.of(context).pushNamed(verifyEmailRoute);
                //  devtools.log(userCredentials.toString());
                //  print(userCredentials);
              } on FirebaseAuthException catch (e) {
                /*   if (e.code == 'user-not-found') {
                  devtools.log('User not found');
                }
                */
                if (e.code == 'weak-password') {
                  await showErrorDialog(
                    context,
                    'weak password entered',
                  );
                  //devtools.log('Weak Password');
                } else if (e.code == 'email-already-in-use') {
                  await showErrorDialog(
                    context,
                    'Email is already in use. try a different one',
                  );
                  //devtools.log('Email is already in use. try a different one');
                } else if (e.code == 'invalid-email') {
                  await showErrorDialog(
                    context,
                    'Invalid email is entered here!',
                  );
                  //devtools.log('Invalid email is entered!');
                } else {
                  await showErrorDialog(
                    context,
                    'Error ${e.code}',
                  );
                }

                // print('Something bad happened');
                // print(e.runtimeType);
                // print(e);
              } catch (e) {
                await showErrorDialog(context, e.toString());
              }
            },
            child: const Text('Register'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(loginRoute, (route) => false);
            },
            child: const Text('Already registered? Login here'),
          )
        ],
      ),
    );

    /* return Scaffold(
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
