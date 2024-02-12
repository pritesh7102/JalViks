import 'package:flutter/material.dart';

class Team extends StatelessWidget {
  const Team({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: const Text('Our Team'),
        backgroundColor: Colors.green[400],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          TeamMember(
            name: 'Ganesh Gupta',
            role: 'Role',
            phoneNumber: '+91 9818790607',
            email: 'gupta.ganesh298@gmail.com',
            profilePhoto: 'assets/jalviks_logo.jpg',
          ),
          SizedBox(height: 16),
          TeamMember(
            name: 'Adrija Roy',
            role: 'Role',
            phoneNumber: '+91 7060968633',
            email: 'adrijaroy1994@gmail.com',
            profilePhoto: 'assets/jalviks_logo.jpg',
          ),
          SizedBox(height: 16),
          TeamMember(
            name: 'Gauri Maheshwari',
            role: 'Role',
            phoneNumber: '+91 6397112479',
            email: 'gm.jalviks@gmail.com.com',
            profilePhoto: 'assets/jalviks_logo.jpg',
          ),
          SizedBox(height: 16),
          TeamMember(
            name: 'Pritesh Sahu',
            role: 'Role',
            phoneNumber: '+91 9977346943',
            email: 'pritesh7102@gmail.com',
            profilePhoto: 'assets/jalviks_logo.jpg',
          ),
          SizedBox(height: 16),
          // Add more TeamMember widgets for other team members
        ],
      ),
    );
  }
}

class TeamMember extends StatelessWidget {
  final String name;
  final String role;
  final String phoneNumber;
  final String email;
  final String profilePhoto;

  const TeamMember({super.key, 
    required this.name,
    required this.role,
    required this.phoneNumber,
    required this.email,
    required this.profilePhoto,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(profilePhoto),
        ),
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(role),
            Text(phoneNumber),
            Text(email),
          ],
        ),
      ),
    );
  }
}
