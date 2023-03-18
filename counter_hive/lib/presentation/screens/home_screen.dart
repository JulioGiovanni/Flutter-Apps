import 'package:counter_hive/presentation/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Provider Hive'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<CounterProvider>().increment();
          },
          child: const Icon(Icons.add)),
      body: Consumer(
        builder: (context, CounterProvider counterProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                const SizedBox(height: 100),
                Center(
                  child: Text(
                    '${counterProvider.counter}',
                    style: const TextStyle(
                        fontSize: 70, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 100),
                SwitchListTile(
                  title: const Text('Haz algo'),
                  value: counterProvider.switchValue,
                  onChanged: (value) => counterProvider.switchValue = value,
                ),
                const SizedBox(height: 200),
                ElevatedButton(
                    onPressed: () {
                      counterProvider.saveCounter();
                    },
                    child: const Text('Guardar')),
                OutlinedButton(
                    onPressed: () {
                      counterProvider.loadCounter();
                    },
                    child: const Text('Cargar Datos')),
              ],
            ),
          );
        },
      ),
    );
  }
}
