
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static const String route = '/';
  
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text(
                'Pig Killer Riders',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image.asset('assets/logo.jpg'),

            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Bienvenido, estamos trabajando en tener nuestro espacio en la web pronto. 🤩',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
