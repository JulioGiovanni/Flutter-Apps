import 'package:flutter/material.dart';

class DonativosScreen extends StatefulWidget {
  final double? donativos;
  final double? totalPaypal;
  final double? totalTarjeta;
  const DonativosScreen({
    Key? key,
    required this.donativos, this.totalPaypal, this.totalTarjeta,
  }) : super(key: key);

  @override
  _DonativosScreenState createState() => _DonativosScreenState();
}

class _DonativosScreenState extends State<DonativosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Donativos obtenidos")),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            widget.donativos! > 10000 ?  const Text('¡Gracias a ti hemos llegado a la meta!',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),) :
            const Text('Aún no hemos llegado a la meta :(',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            const SizedBox(height: 20,),
            widget.donativos! > 10000 ?  Image.asset('assets/icons/perro.png') :
            Image.asset('assets/icons/triste.png'),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/icons/paypal.png',
                  width: 50,
                  height: 50,
                ),
                Text("Total PayPal: ${widget.totalPaypal}",style: const TextStyle( fontSize: 20 ),),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/icons/tarjeta-de-credito.png',
                  width: 50,
                  height: 50,
                ),
                Text("Total Tarjeta: ${widget.totalTarjeta}",style: const TextStyle( fontSize: 20 ),),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: Text("Total Donativos: ${widget.donativos}", style: const TextStyle( fontSize: 20, fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
}