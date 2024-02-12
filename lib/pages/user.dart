import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jalviks/pages/update_info.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Information'),
          backgroundColor: Colors.green[400],
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // Navigate to the screen where user can update their information
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpdateUserInfoPage()),
                );
              },
            ),
          ],
        ),
        body: StreamBuilder(
          // stream: FirebaseFirestore.instance.collection('user_info').snapshots(),
          stream: FirebaseFirestore.instance
              .collection('user_info')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                var userData = snapshot.data!.data();
                if (userData != null) {
                  return ListTile(
                    // leading: const CircleAvatar(
                    //   child: Text("1"),
                    // ),
                    title: Text("Name: ${userData['name']}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("City: ${userData['city']}"),
                        Text("Contact: ${userData['contact']}"),
                        Text(
                            "Email: ${userData['email']}"), // Display 'email' field
                        Text(
                            "Crops: ${userData['crops']}"), // Display 'crops' field
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('No data found for this user'),
                  );
                }
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.hasError.toString()}'),
                );
              } else {
                return const Center(
                  child: Text('No data found'),
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
