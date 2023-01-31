import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
int _likes = 0;

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('¡Bienvenidos al ITESO!'),
        ),
        body: Column(
          children:[
            Image.network('https://cruce.iteso.mx/wp-content/uploads/sites/123/2018/04/Portada-2-e1525031912445.jpg'),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
              children: [
                 Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const[
                         Text('El ITESO, Universidad Jesuita de Guadalajara',style: TextStyle(fontWeight: FontWeight.bold)),
                         Text('San Pedro Tlaquepaque, Jal', style:TextStyle(color: Colors.black45))
                      ]
                    ),
                    Expanded(child: Container()),
                    IconButton(onPressed: (){
                      setState(() {
                        _likes++;
                      });
                    }, icon: const Icon(Icons.thumb_up,color: Colors.blue)),
                    Text('$_likes')
                  ],
                 ),
                 Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                     ButtonIcon(icon: Icons.mail,text:'Correo',snackBarText:'Enviar Correo'),
                     ButtonIcon(icon: Icons.call,text:'Llamada',snackBarText: 'Hacer Llamada',),
                     ButtonIcon(icon:Icons.route,text:'Ruta',snackBarText: 'Ir al ITESO',),
                   ],),
                 )
              ],
            )),
            const Padding(padding:  EdgeInsets.all(20),
            child:Text('El ITESO, Universidad Jesuita de Guadalajara, es una universidad privada ubicada en la Zona Metropolitana de Guadalajara,Jalisco México fundada en el año 1957. La institución forma parte del Sistema Universitario que integra a ocho universidades en México ',textAlign: TextAlign.justify, style: TextStyle(fontWeight: FontWeight.bold),))
          ]
        )
      ),
    );
  }
}

class ButtonIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final String snackBarText;
  const ButtonIcon({
    required this.icon,
    required this.text,
    required this.snackBarText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(icon: Icon(icon,size: 40,), onPressed: (){
          ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(snackBarText)));
        }),
        Text(text)
      ],
    );
  }
}