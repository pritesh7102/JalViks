import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: const Text('About JalViks'),
        backgroundColor: Colors.green[400],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'JALVIKS – Climate Service for Empowering Farmers with Climate-Smart Irrigation',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Join the sustainable agricultural revolution with our innovative climate service app! 🌍',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 24),
              Text(
                'JalViks is a climate service platform that connects farmers and state governments, transforming irrigation management. JaLViks delivers statistics on farmers and irrigation management. Our app integrates weather forecasts, irrigation planning, soil moisture levels, and agricultural yield enhancement based on the data. Our app provides ideas for designing efficient irrigation systems for the betterment of agriculture and water conservation. The model combines data from soil moisture sensors, L-band satellite observations, machine learning, and S2S meteorological forecasts. Use our extensive monitoring tools to optimize soil moisture levels. Understand soil dynamics and adapt irrigation strategies accordingly to ensure healthy root growth while alleviating water waste.\n\nJoin the climate revolution and transform your irrigation strategy with our unique app. Together, we can create a future in which agriculture flourishes alongside nature, protecting our world for future generations. Download the app today and start your path towards a greener, more resilient agricultural landscape. Climate Smart Agriculture, Sustainable Farming, and Irrigation Innovation 🌱🚜',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
