import 'package:flutter/material.dart';

class ActividadesWidget extends StatelessWidget {
  const ActividadesWidget({
    super.key, required this.titulo, required this.imagen, required this.index,
  });
  final int index;
  final String titulo;
  final String imagen;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(imagen,width: 120,height: 120, fit: BoxFit.cover,),
          Text('Día ${index+1}',style: const TextStyle(fontSize: 11),),
          Text(titulo),
        ],
      ),
    );
  }
}