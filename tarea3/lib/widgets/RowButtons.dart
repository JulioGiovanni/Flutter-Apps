import 'package:flutter/material.dart';

class RowButtons extends StatelessWidget {
  const RowButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:[
        ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,foregroundColor: Colors.grey[200]
        ),child:  const Text('Detalles')),
        const Text('Detalles del vuelo')
      ]
    );
  }
}