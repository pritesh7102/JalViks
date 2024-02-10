import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: const Text('Weather Info'),
        backgroundColor: Colors.green[400],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This page will be updated soon!',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}