
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pig_killer_riders/ui/ui.dart';

class Home extends StatelessWidget {
  static const String name = 'PKR';
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
              padding: EdgeInsets.only(top: 20, bottom: 40),
              child: Text(
                'Bienvenido, estamos trabajando en tener nuestro espacio en la web pronto. 🤩',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),

            TextButton(
              onPressed:
                () => context.pushNamed(AccountStatements.route),
              child: Text('Ir a estados de cuentas', style: TextStyle(color: Colors.white),))
          ],
        ),
      ),
    );
  }
}
