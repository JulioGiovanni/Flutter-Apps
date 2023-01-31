import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  //Create a state for each button

  bool _button1 = false;
  bool _button2 = false;
  bool _button3 = false;
  bool _button4 = false;



  Widget build(BuildContext context) {
    

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mc Flutter'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    const Icon(Icons.account_circle,size: 50,),
                    Column(
                      children: const [
                        Text('Flutter McFlutter', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                        Text('Experienced App Developer'),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const[
                      Text('123 Main Street',),
                      Text('123-456-7890'),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(onPressed: (() => {
                      setState(() {
                        _button1 = !_button1;
                      })
                    }), icon: const Icon(Icons.settings_accessibility), color: _button1 ? Colors.indigo : Colors.black),
                    IconButton(onPressed: (() => {
                      setState(() {
                        _button2 = !_button2;
                      })
                    }), icon: const Icon(Icons.timer), color: _button2 ? Colors.indigo : Colors.black),
                    IconButton(onPressed: (() => {
                      setState(() {
                        _button3 = !_button3;
                      })
                    }), icon: const Icon(Icons.phone_iphone), color: _button3 ? Colors.indigo : Colors.black),
                    IconButton(onPressed: (() => {
                      setState(() {
                        _button4 = !_button4;
                      })
                    }), icon: const Icon(Icons.phone_iphone), color: _button4 ? Colors.indigo : Colors.black)
                  ],
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}