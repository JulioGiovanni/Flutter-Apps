import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children:  [
            ListTile(
              leading:  const Icon(Icons.hotel),
              title:   textTop('Balis Beach Resort'),
              subtitle:  Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const [
                     Icon(Icons.star, color: Colors.yellow),
                     Icon(Icons.star, color: Colors.yellow),
                     Icon(Icons.star, color: Colors.yellow),
                     Icon(Icons.star, color: Colors.yellow),
                     Text("4.1"),
                ],
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Column(
                  children:[
                    textTitleTable("Duración"),
                    textCellTable("7 días"),
                  ]
                ),
                Column(
                  children:[
                    textTitleTable("Participantes"),
                    textCellTable("10 Personas"),
                  ]
                ),
                Column(
                  children:[
                    textTitleTable("Estadia"),
                    textCellTable("Hotel 5 estrellas"),
                  ]
                ),
              ]
            ),
             const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    textTotalPrice("Total:"),
                    const Text("\$ 1,225.00/Persona"),
                  ]
                )
          ],
        )
      ),
    );
  }
}


  // Metodos que retornan un Text pero estilizado
  Widget textTop(String text) => Text(
        text,
        style: MyTextStyles().topTitle,
      );
  Widget textTitleTable(String text) => Text(
        text,
        style: MyTextStyles().catagoryTable,
      );
  Widget textCellTable(String text) => Text(
        text,
        style: MyTextStyles().cellTable,
      );
  Widget textTotalPrice(String text) => Text(
        text,
        style: MyTextStyles().totalPrice,
      );


class MyTextStyles {
  final TextStyle topTitle = const TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.w900,
  );
  final TextStyle catagoryTable = const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w300,
  );
  final TextStyle cellTable = const TextStyle(fontSize: 14);
  final TextStyle totalPrice = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
}