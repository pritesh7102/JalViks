import 'package:flutter/material.dart';
import 'package:jalviks/models/users.dart';
import 'package:jalviks/screens/wrapper.dart';
// import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:jalviks/services/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAYiCpoVmNXOvki9JPjJdMp5BgAx1MZtC4",
      appId: "1:306896513056:android:e23e7dbbed20d78fab7445",
      messagingSenderId: "306896513056",
      projectId: "jalviks",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<ClassUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: const MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
