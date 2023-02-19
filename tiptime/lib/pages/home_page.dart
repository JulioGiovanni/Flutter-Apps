import 'package:flutter/material.dart';

import '../widgets/radio_list.dart';
import '../widgets/round_switch.dart';

class HomePage extends StatefulWidget {


   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List <Map<String,String>> _radioButtons = [
    {'label': 'Meh', 'value': '5'},
    {'label': 'Normal', 'value': '10'},
    {'label': 'Okay', 'value': '15'},
    {'label': 'Good', 'value': '18'},
    {'label': 'Amazing', 'value': '20'},
  ];

  final String _rateService = "" ;

  double tip = 0.0;

  final TextEditingController _totalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tip Time'),
        ),
        body: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.store),
                labelText:('Total'),
                suffixStyle: TextStyle(color: Colors.green)
              ),
              controller: _totalController,
            ),

            const Text('How was the service?',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ..._radioButtons.map((radioButton) => RadioList(label:radioButton['label']!, value:radioButton['value']!,variable: _rateService)),
            RoundTip(),
            ElevatedButton(onPressed: () {
              print(_totalController.text);
              setState(() {
                // tip = double.parse(_totalController.text) * double.parse(_rateService) / 100;
              });
            }, child: const Text('Calculate')),
            
            Text('$tip'),
          ],
        )
      );
  }
}


