import 'package:donativos_app/pages/second_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body:  Center(
          child: ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, '/second');
          }, child: const Text('Go to second page')),

        ),
      );
  }
}