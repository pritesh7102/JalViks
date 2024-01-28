import 'package:flutter/material.dart';
import 'package:jalviks/screens/home/userInfo.dart';
import 'package:jalviks/services/auth.dart';
import 'package:jalviks/shared/drawer.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        title: const Text('JalViks'),
        backgroundColor: Colors.purple[400],
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
            icon: const Icon(Icons.notifications, color: Colors.black),
            label: const Text(''),
            onPressed: () {
              // Add your logic for handling notifications
              // Example: Open a notifications screen or show a notification
            },
          ),  
          TextButton.icon(
            icon: const Icon(Icons.person, color: Colors.black),
            label: const Text('Logout', style: TextStyle(color: Colors.black),),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
      // body: userList(),
      drawer: const MyDrawer(),
    );
  }
}
