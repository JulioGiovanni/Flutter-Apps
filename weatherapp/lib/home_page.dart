import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          height: 200,
          margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          color: Colors.orange,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('San Francisco',style: TextStyle(fontSize: 30,color: Colors.white)),
                  Text('Nublado',style: TextStyle(fontSize: 16,color: Colors.white54),)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.wb_cloudy,size: 60,color: Colors.white,),
                  Text('22 º',style: TextStyle(fontSize: 60,color: Colors.white,fontWeight: FontWeight.w200)),
                ],
              ),
              Center(
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.yellow),
                  ),
                  onPressed: (){
                    

                    ScaffoldMessenger.of(context).showSnackBar(  SnackBar(content: const Text('Actualizando datos'),
                    action: SnackBarAction(label: 'Deshacer', onPressed: (){}),));
                    
                  }, child: const Text('Actualizar datos',style: TextStyle(color: Colors.black),)),
              )
            ],
          )
          );
  }
}


