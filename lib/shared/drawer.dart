import "package:flutter/material.dart";

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
              color: Colors.purple,
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
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text('Location'),
            onTap: () {
              // Handle navigation to user location screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.sunny_snowing),
            title: const Text('Weather'),
            onTap: () {
              // Handle navigation to user weather screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About JalViks'),
            onTap: () {
              // Handle navigation to About screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.supervised_user_circle_rounded),
            title: const Text('Our Team'),
            onTap: () {
              // Handle navigation to Team screen
            },
          ),
          // Add more list tiles for additional items in the drawer
        ],
      ),
    );
  }
}