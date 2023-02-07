import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String password32 = '';
  String password16 = '';
  String password8 = '';

  bool passExists = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
      
          children: [
            Passwords(passExists: passExists, password: password32, number: 32),
            Passwords(passExists: passExists, password: password16, number: 16),
            Passwords(passExists: passExists, password: password8, number: 8),

             Expanded(child: Container()),
             ElevatedButton(onPressed: (){
              setState(() {
                password32 = _generatePass(32);
                password16 = _generatePass(16);
                password8 = _generatePass(8);
                passExists = true;
              });
             }, child: const Text('Generar nueva contraseña')),
          
            passExists ? ElevatedButton(onPressed: (){
              setState(() {
                password32 = '';
                password16 = '';
                password8 = '';
                passExists = false;
              });
            }, child: const Text('Borrar contraseñas ')): const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Passwords extends StatefulWidget {
   Passwords({
    super.key,
    required this.number,
    required this.passExists,
    required this.password,
  });

  final int number ;
  final bool passExists;
  String password;


  @override
  State<Passwords> createState() => _PasswordsState();
}

class _PasswordsState extends State<Passwords> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children:[
        Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
               Expanded(child: Text('${widget.number} Caracteres:',style: const TextStyle(fontWeight: FontWeight.bold),)),
              widget.passExists ?
              Row(
                children: [
                  Text(widget.password),
                  IconButton(onPressed: (){
                    setState(() {
                      widget.password = _generatePass(widget.number);
                    });
                  }, icon: const Icon(Icons.refresh,color: Colors.blue,size: 26,)),
                  IconButton(onPressed: (){
                    ScaffoldMessenger.of(context).showSnackBar(  const SnackBar(content: Text('Contraseña copiada al portapapeles')));
                    Clipboard.setData(ClipboardData(text: widget.password));
                    
                  }, icon: const Icon(Icons.content_copy,color: Colors.blue,size: 20))
                ],
              ) : const SizedBox(height:30),
            ],
          ),
        ),
      ],
    );
  }
}

String _generatePass(int number){
  return String.fromCharCodes(List.generate(number, (index) => Random().nextInt(48)+60));
}
