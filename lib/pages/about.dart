import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: const Text('About JalViks'),
        backgroundColor: Colors.green[400],
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Introducing "JalViks," a revolutionary app designed to empower farmers. '
                'Get real-time weather updates, crop-specific insights, and market trends. '
                'JalViks aids farmers in making informed decisions and fosters a supportive community with interactive forums. '
                'Enhance productivity and cultivate success with JalViks - your digital companion in agriculture.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
