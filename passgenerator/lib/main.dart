import 'package:flutter/material.dart';
import 'package:passgenerator/home_page.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Generar contraseñas'),
          backgroundColor: Colors.deepPurple,
        ),
        body: const HomePage(),
      ),
    );
  }
}

