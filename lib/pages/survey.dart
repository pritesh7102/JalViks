import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SurveyPage extends StatefulWidget {
  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _contactController = TextEditingController();
  final _addressController = TextEditingController();
  final _landOwnedController = TextEditingController();
  final _cropsGrownController = TextEditingController();
  final _waterSourceController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _contactController.dispose();
    _addressController.dispose();
    _landOwnedController.dispose();
    _cropsGrownController.dispose();
    _waterSourceController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Save the form data to Firestore
      FirebaseFirestore.instance.collection('surveys').add({
        'name': _nameController.text,
        'contact': _contactController.text,
        'address': _addressController.text,
        'landOwned': int.parse(_landOwnedController.text),
        'cropsGrown': _cropsGrownController.text,
        'waterSource': _waterSourceController.text,
      });

      // Clear the form fields
      _nameController.clear();
      _contactController.clear();
      _addressController.clear();
      _landOwnedController.clear();
      _cropsGrownController.clear();
      _waterSourceController.clear();

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Survey submitted successfully')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: const Text('Survey Page'),
        backgroundColor: Colors.green[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _contactController,
                decoration: const InputDecoration(labelText: 'Contact'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your contact';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Address'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _landOwnedController,
                decoration: const InputDecoration(labelText: 'Area of Land Owned'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the area of land owned';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _cropsGrownController,
                decoration: const InputDecoration(labelText: 'Crops Grown'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the crops grown';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _waterSourceController,
                decoration: const InputDecoration(labelText: 'Primary Source of Water'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the primary source of water';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit', style: TextStyle(
                            color: Colors.green, // Change the color here
                          ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
