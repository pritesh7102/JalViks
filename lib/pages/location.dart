import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  String _currentLocation = '';

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentLocation =
          'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: Text('Location Info'),
        backgroundColor: Colors.green[400],
      ),
      body: Center(
        child: Text(
          _currentLocation,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
