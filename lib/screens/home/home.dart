import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jalviks/pages/notifications.dart';
import 'package:jalviks/screens/home/userInfo.dart';
import 'package:jalviks/services/auth.dart';
import 'package:jalviks/shared/drawer.dart';
import 'package:jalviks/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[100],
        appBar: AppBar(
          title: const Text('JalViks'),
          backgroundColor: Colors.green[400],
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
              icon: const Icon(Icons.notifications, color: Colors.black),
              label: const Text(''),
              onPressed: () {
                // Add your logic for handling notifications
                // Example: Open a notifications screen or show a notification
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Notifications()),
                );
              },
            ),
            TextButton.icon(
              icon: const Icon(Icons.person, color: Colors.black),
              label: const Text(
                'Logout',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        // body: userList(),

        body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Replace 'assets/your_image.jpg' with the path to your image asset
            Image.asset(
              'jalviks_logo.jpg',
              width: 200, // Adjust the width as needed
              height: 200, // Adjust the height as needed
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            const Text(
              'JalViks',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),

        drawer: const MyDrawer(),
      );
  }
}
