import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:jalviks/pages/about.dart";
import "package:jalviks/pages/location.dart";
import "package:jalviks/pages/team.dart";
import "package:jalviks/pages/user.dart";
import "package:jalviks/pages/weather.dart";

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Text(
              'User_name', // I have to change the code here such that it shows the name of the user
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
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
                  MaterialPageRoute(builder: (context) => const UserPage()),
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
                  MaterialPageRoute(builder: (context) => const location()),
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