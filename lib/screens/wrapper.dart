// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jalviks/models/users.dart';
import 'package:jalviks/screens/authenticate/authenticate.dart';
import 'package:jalviks/screens/home/home.dart';
import 'package:provider/provider.dart';
// import 'package:jalviks/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ClassUser?>(context);
    //listen to the wrapper and return either home or the authenticate page
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
