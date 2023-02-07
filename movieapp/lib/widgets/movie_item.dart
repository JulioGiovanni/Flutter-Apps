import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, required this.title, required this.description, required this.image});

  final String title;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        //show dialog
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            title: const Text('Selección guardada'),
            content: Text('Se ha seleccionado el elemento: $title', style: const TextStyle(fontSize: 18),),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Ok'),
              ),
            ],
          ),
        );
      },
      child: Container(
        height: 250,
        width: 250,
        margin: const EdgeInsets.only(right: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
                  Positioned.fill(child: 
                      Image.network(image,
                        fit: BoxFit.fill,
                      )
                    ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration:  BoxDecoration(
                      //   gradient: LinearGradient(
                      //     begin: Alignment.topCenter,
                      //     end: Alignment.bottomCenter,
                      //     colors: [Colors.transparent, Colors.black],
                      //   ),
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(20)),
                      color: Colors.blue[700],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(title,style: const  TextStyle(color: Colors.white,fontSize: 30, fontWeight: FontWeight.bold),),
                          Text(description, style: const  TextStyle(color: Colors.white,fontSize: 24),),
                        ],
                      ),
                    ),
                  ),
                ],
          ),
        ),
      ),
    );
  }
}