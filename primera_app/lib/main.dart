import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Birthday Card'),
        ),
        body: Column(
          children:  [
            const Text('Happy Birthday Frank', style: TextStyle(fontSize: 30)),

            const Expanded(child: Image(image: NetworkImage('https://img.freepik.com/free-vector/detailed-birthday-lettering_52683-58875.jpg?w=2000'))),

            // Align(
            //   alignment: Alignment.centerRight ,
            //   child: Text('From Mike', style: TextStyle(fontSize: 16,)),
            // ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text('From Mike', style: TextStyle(fontSize: 16,)),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}