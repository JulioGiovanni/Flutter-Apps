import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;
  bool _switch = false;

  bool get switchValue => _switch;

  set switchValue(bool value) {
    _switch = value;
    notifyListeners();
  }

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  saveCounter() async {
    try {
      var box = await Hive.openBox<int>('contadores');
      await box.put('contador', _counter);
      var switchBox = await Hive.openBox<bool>('switch');
      await switchBox.put('switch', _switch);
    } catch (e) {
      print(e);
    }
  }

  loadCounter() async {
    try {
      //Abrir la caja
      var box = await Hive.openBox<int>('contadores');
      //Obtener el valor de la caja
      _counter = box.get('contador') ?? 0;
      var switchBox = await Hive.openBox<bool>('switch');
      _switch = switchBox.get('switch') ?? false;
      //Actualizar el valor de la caja y notificar a los widgets que esten escuchando
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
