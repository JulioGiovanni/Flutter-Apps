import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
   
const ResultPage({Key? key}) : super(key: key);
      
    @override
    
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('ResultPage'),
            ),
            body: const Center(
                child: Text('ResultPage'),
            ),
        );
    }
}