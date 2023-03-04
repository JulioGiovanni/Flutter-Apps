import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:amphibians/presentation/models/amphibian/amphibian.dart';

class AmphibiansProvider with ChangeNotifier{

  final String _url = 'https://bit.ly/3XPPD2C';
  
  List<Amphibian> _amphibians = [];

  List<Amphibian> get getAmphibiansList => _amphibians;

  Future<void> getAmphibians() async {
      try {
        
        var res = await http.get(Uri.parse(_url));

        if (res.statusCode == 200) {
          _amphibians = (jsonDecode(res.body) as List)
              .map((e) => Amphibian.fromMap(e))
              .toList();
        }
        notifyListeners();

      } catch (e) {
        print(e.toString());
        notifyListeners();
      }
    }

}
