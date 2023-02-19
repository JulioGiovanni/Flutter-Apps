
import 'package:donativos/pages/donativos.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double donacionesAcumuladas = 0.0;
  double total = 10000;
  double progress = 0.0;
  int? currentRadio;
  int? currentDropItem;
  double totalPaypal = 0.0;
  double totalTarjeta = 0.0;
  var assetsGroup = {
    0: "assets/icons/paypal.png",
    1: "assets/icons/tarjeta-de-credito.png",
  };
  var radioGroup = {
    0: "PayPal",
    1: "Tarjeta",
  };
  var dropItemsGroup = {
    0: 100,
    1: 350,
    2: 850,
    3: 1050,
    4: 9999,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Donaciones")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Text(
              "Es para una buena causa",
              style:  TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
            ),
            const Text(
              "Elija modo de donativo",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              margin:  const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: radioGroupGenerator(),
              ),
            ),
            ListTile(
              title: const Text("Cantidad a donar:"),
              trailing: DropdownButton(
                items: dropDownItemsGenerator(),
                value: currentDropItem,
                onChanged: (int? selected) {
                  currentDropItem = selected;
                 
                },
              ),
            ),
            LinearProgressIndicator(
              value: progress/100,
              minHeight: 24,
            ),
            //Si es mayor a 100, entonces mostrar 100, si no mostrar el valor de progress
            Text(
              "${(progress > 100 ? 100 : progress).toStringAsFixed(2)}%",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            MaterialButton(
              onPressed: () {
                donacionesAcumuladas += currentDropItem ?? 0;
                progress = donacionesAcumuladas / total * 100;
                progress = progress > 100.0 ? 100.0 : progress;
                setState(() {
                  if (currentRadio == 0) {
                    totalPaypal += currentDropItem ?? 0;
                  } else {
                    totalTarjeta += currentDropItem ?? 0;
                  }
                });
              },
              color: Colors.cyan[100],
              child: const Text("Donar"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.text_format),
        onPressed: () {
          // Navegar a otra pantalla
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DonativosScreen(
                donativos: donacionesAcumuladas,
                totalPaypal: totalPaypal,
                totalTarjeta: totalTarjeta,
              ),
            ),
          );
          // Navigator.of(context).pushNamed("/donativos");
        },
      ),
    );
  }

  dropDownItemsGenerator() {
    return dropItemsGroup.entries
        .map(
          (dropDownelement) => DropdownMenuItem(
            value: dropDownelement.value,
            child: Text("${dropDownelement.value}"),
          ),
        )
        .toList();
  }

  radioGroupGenerator() {
    return radioGroup.entries
        .map(
          (radioElement) => ListTile(
            leading: Image.asset('${assetsGroup[radioElement.key]}',
              width: 40,
              height: 40,
              ),
            trailing: Radio(
              value: radioElement.key,
              groupValue: currentRadio,
              onChanged: (int? selected) {
                currentRadio = selected;
                setState(() {});
              },
            ),
            title: Text(radioElement.value),
          ),
        )
        .toList();
  }
}