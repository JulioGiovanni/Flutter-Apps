import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiptime/provider/tip_provider.dart';

import '../widgets/radio_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> radioButtons = [
    {'label': 'Meh (5%)', 'value': '0.05'},
    {'label': 'Normal (10%)', 'value': '0.1'},
    {'label': 'Okay (15%)', 'value': '0.15'},
    {'label': 'Good (18%)', 'value': '0.18'},
    {'label': 'Amazing (20%)', 'value': '0.2'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tip Time'),
        ),
        body: Consumer(
          builder: (context, TipProvider provider, child) {
            return Column(
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.store),
                      labelText: ('Total'),
                      suffixStyle: TextStyle(color: Colors.green)),
                  controller: provider.service,
                ),
                const SizedBox(height: 20),
                const Text(
                  'How was the service?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: radioGroupGenerator(
                        provider.tipSelected,
                        (int selected) => provider.setTipSelected(selected),
                        (double value) => provider.setTipPercentage(value)),
                  ),
                ),
                SwitchListTile(
                  value: provider.roundTip,
                  onChanged: (value) {
                    provider.roundTipSwitch(value);
                  },
                  title: const Text('Round Tip Up?'),
                ),
                ElevatedButton(
                    onPressed: () {
                      provider.calculateTotalTip();
                    },
                    child: const Text('Calculate')),
                const SizedBox(height: 30),
                Text('${provider.total}', style: const TextStyle(fontSize: 30)),
              ],
            );
          },
        ));
  }

  radioGroupGenerator(int currentRadio, void Function(int selected) setRadios,
      void Function(double value) setPercentage) {
    return radioButtons
        .asMap()
        .entries
        .map<Widget>((entry) => ListTile(
              trailing: Radio(
                value: entry.key,
                groupValue: currentRadio,
                onChanged: (dynamic value) {
                  setRadios(value as int);
                  setPercentage(double.parse(radioButtons[value]['value']!));
                },
              ),
              title: Text(entry.value['label']!),
            ))
        .toList();
  }
}
