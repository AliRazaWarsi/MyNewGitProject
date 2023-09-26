import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_testingfirebase/views/login_view.dart';
import 'package:flutter_application_testingfirebase/views/register_view.dart';
import 'package:flutter_application_testingfirebase/views/verify_email_view.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(
    MaterialApp(
        title: ' Flutter firebase integeration',
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        // home: const RegisterView(),
        home: const HomePage(),
        routes: {
          '/login/': (context) => const LoginView(),
          '/register/': (context) => const RegisterView(),
        }
        //home: RegisterView(),
        //home: const RegisterView(),
        //home: const MyHomePage(title: 'Flutter Demo Home Page'),
        ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Home'),
      ),
      body: FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                final user = FirebaseAuth.instance.currentUser;
                if (user != null) {
                  if (user.emailVerified) {
                    print('Email is verified.');
                  } else {
                    return const  VerifyEmailView();
                    //return const Text('done');
                  }
                } else {
                  return const LoginView(); 
                }
                // //   print(FirebaseAuth.instance.currentUser);
                // final user = FirebaseAuth.instance.currentUser;
                // if (user?.emailVerified ?? false) {
                //   //  print('You are a verified user');
                // } else {
                //   //  print('You need to verify your email first');
                //   Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => VerifyEmailView(),
                //   ));

                return const Text('Done');

              default:
                return const CircularProgressIndicator();
              //  return const Text('Please wait. Your View is Loading.....');
            }
            //return const Text('Done');
          }),
    );
  }
}

/* class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify Email"),
      ),
      body: Column(children: [
        const Text('Please verify your email address:'),
        TextButton(
          onPressed: () async {
            final user = FirebaseAuth.instance.currentUser;
            await user?.sendEmailVerification();
          },
          child: const Text('Send email verification'),
        )
      ]),
    );
  }
}
*/



// class RegisterView extends StatefulWidget {
//   const RegisterView({super.key});

//   @override
//   State<RegisterView> createState() => _RegisterViewState();
// }

// class _RegisterViewState extends State<RegisterView> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

