import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:jalviks/pages/about.dart";
import "package:jalviks/pages/location.dart";
import "package:jalviks/pages/survey.dart";
import "package:jalviks/pages/team.dart";
import "package:jalviks/pages/user.dart";
import "package:jalviks/pages/weather.dart";
import 'package:cloud_firestore/cloud_firestore.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  Future<Map<String, dynamic>> getUserData() async {
    var document = await FirebaseFirestore.instance
        .collection('user_info')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return document.data() as Map<String, dynamic>;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          FutureBuilder<Map<String, dynamic>>(
            future: getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return DrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.green,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${snapshot.data!['name']}', // Display user's name
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          '${snapshot.data!['city']}', // Display user's city
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                    child: Text(
                      'No data',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  );
                }
              } else {
                return const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Handle navigation to home screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('User Info'),
            onTap: () {
              // Handle navigation to user info screen
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ShowData()),
                );
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text('Location'),
            onTap: () {
              // Handle navigation to user location screen
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LocationPage()),
                );
            },
          ),
          ListTile(
            leading: const Icon(Icons.sunny_snowing),
            title: const Text('Weather'),
            onTap: () {
              // Handle navigation to user weather screen
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Weather()),
                );
            },
          ),
          ListTile(
            leading: const Icon(Icons.assignment),
            title: const Text('Survey Form'),
            onTap: () {
              // Handle navigation to Survey Form screen
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SurveyPage()),
                );
            },
          ),
          
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About JalViks'),
            onTap: () {
              // Handle navigation to About screen
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const About()),
                );
            },
          ),
          ListTile(
            leading: const Icon(Icons.supervised_user_circle_rounded),
            title: const Text('Our Team'),
            onTap: () {
              // Handle navigation to Team screen
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Team()),
                );
            },
          ),
          // Add more list tiles for additional items in the drawer
        ],
      ),
    );
  }
}