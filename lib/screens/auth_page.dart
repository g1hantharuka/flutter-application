import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sample_project/screens/homepage.dart';
import 'package:sample_project/screens/loginPage.dart';


//blank A stateless widget
class AuthPage extends StatelessWidget {
  const AuthPage( {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body with streambuilder <User>which uses firebaseauth as the stream
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //if snapshot has data, return homepage
          if (snapshot.hasData) {
            return HomePage();
          } else {
            //else return loginpage
            return LoginPage();
          }
        },
      ),
    );
  }
}
