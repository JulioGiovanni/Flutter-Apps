import 'package:flutter/material.dart';
import 'package:tarea3/widgets/ActividadesContainer.dart';
import 'package:tarea3/widgets/CardWidget.dart';
import 'package:tarea3/widgets/RowButtons.dart';


class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
  final double imageHeigth = MediaQuery.of(context).size.height/4;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reserva tu hotel'),
      ),
      body:LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ClipRRect(
                    borderRadius:  const BorderRadius.all(Radius.circular(20)),
                    child: Image(
                      image: const AssetImage('lib/assets/hotel-exterior.jpg'),
                      fit: BoxFit.cover,
                      //get the height of the screen
                      height: imageHeigth ,
                      width: double.infinity,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 64,
                left: 0,
                right: 0,
                bottom: 0,
                child: ListView(children:   [
                      const CardWidget(),
                      const RowButtons(),
                       ActividadesContainer(),
                      MaterialButton(onPressed: () {
                        //Show snack bar
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Reservación en progreso'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } ,color: Colors.red,child: const Text('Reservar',style: TextStyle(color: Colors.white)))
                  ] 
                ),
              )
            ],
          );
        },
      )
    );
  }
}





