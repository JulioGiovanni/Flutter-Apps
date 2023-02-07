import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
   
const HomePage({Key? key}) : super(key: key);
      
    @override
    
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Librería Free to Read'),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Buscar libro por título',
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      ),
                      )
                      
                    )),
                const SizedBox(
                  height: 300,
                ),
                const Center(
                    child: Text('Ingrese una palabra para buscar libros'),
                ),
              ],
            ),
        );
    }
}