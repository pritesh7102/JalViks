import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateUserInfoPage extends StatefulWidget {
  @override
  _UpdateUserInfoPageState createState() => _UpdateUserInfoPageState();
}

class _UpdateUserInfoPageState extends State<UpdateUserInfoPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _cityController = TextEditingController();
  final _contactController = TextEditingController();
  final _emailController = TextEditingController();
  final _cropsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Information'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: _cityController,
              decoration: const InputDecoration(labelText: 'City'),
            ),
            TextFormField(
              controller: _contactController,
              decoration: const InputDecoration(labelText: 'Contact'),
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: _cropsController,
              decoration: const InputDecoration(labelText: 'Crops Grown'),
            ),
            ElevatedButton(
              child: const Text('Update'),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await FirebaseFirestore.instance
                      .collection('user_info')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .update({
                    'name': _nameController.text,
                    'city': _cityController.text,
                    'contact': _contactController.text,
                    'email': _emailController.text,
                    'crops': _cropsController.text,
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Information updated')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}