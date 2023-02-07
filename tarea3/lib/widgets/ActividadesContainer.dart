
import 'package:flutter/material.dart';
import 'package:tarea3/widgets/ActividadesWidget.dart';

class ActividadesContainer extends StatelessWidget {
   ActividadesContainer({
    super.key,
  });

  final actividades = [
    {
      'titulo': 'Cristo Redentor',
      'imagen': 'lib/assets/rio.jpeg',
    },
    {
      'titulo': 'Torre Eiffel',
      'imagen': 'lib/assets/paris.jpeg',
    },
    {
      'titulo': 'Pirámide Maya',
      'imagen': 'lib/assets/piramide.jpeg',
    },
    {
      'titulo': 'Torre inclinada de Pisa',
      'imagen': 'lib/assets/pisa.jpeg',
    },
    {
      'titulo': 'Stonehenge',
      'imagen': 'lib/assets/stonehenge.jpeg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     height: 200.0,
     child: ListView.builder(scrollDirection: Axis.horizontal,
     itemCount: actividades.length,
     itemBuilder: (context, index) {
       return ActividadesWidget( titulo: actividades[index]['titulo']!, imagen: actividades[index]['imagen']!,index:index );
     },
     ),
    );
  }
}

