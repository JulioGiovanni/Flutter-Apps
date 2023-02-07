import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
   HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _alturaController = TextEditingController();

  final TextEditingController _pesoController = TextEditingController();

  bool _isMale = false;

  bool _isFemale = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
        actions: [
          IconButton(onPressed: (){
            _alturaController.clear();
            _pesoController.clear();

          }, icon: const Icon(Icons.delete))],
      ),
      body: Column(
        children: [
         const Text('Ingrese sus datos para calcular el IMC'),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
             IconButton(onPressed: (){
                setState(() {
                  _isFemale = false;
                  _isMale = !_isMale;
                });
             }, icon: const Icon(Icons.male),color: _isMale ? Colors.green : null,),
             IconButton(onPressed: (){
                setState(() {
                  _isMale = false;
                  _isFemale = !_isFemale;
                });
             }, icon: const Icon(Icons.female),color: _isFemale ? Colors.green : null,)
           ],
         ),
         TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              icon: Icon(Icons.height),
              labelText:('Ingrese su altura'),
              suffixStyle: TextStyle(color: Colors.green)
            ),
            controller: _alturaController,
            keyboardType: TextInputType.number,
         ),
    
         const SizedBox(height: 10,),
         
         TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              icon: Icon(Icons.monitor_weight),
              labelText:('Ingrese su peso'),
              suffixStyle: TextStyle(color: Colors.green)
            ),
            controller: _pesoController,
            keyboardType: TextInputType.number,
         ),
         MaterialButton(onPressed: (){
            final double altura = double.parse(_alturaController.text);
            final double peso = double.parse(_pesoController.text);
            final double imc = peso / (altura * altura);
            final String gender = _isMale ? 'Hombre' : _isFemale ? 'Mujer' : 'No seleccionado';


            showDialog(context: context, builder: (context){
              return AlertDialog(
                title: const Text('Resultado'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Tu IMC es: $imc'),
                    const SizedBox(height: 10,), 
                    Text('Tabla del IMC para $gender'),
                  ],
                ),
                actions: [
                  TextButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, child: const Text('Aceptar'))
                ],
              );
            });
         },child: const Text('Calcular'),)
         
        ],
      ),
    );
  }
}