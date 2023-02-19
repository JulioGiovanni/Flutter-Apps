
import 'dart:convert';

import 'package:cripto_lists/data/constants.dart';
import 'package:cripto_lists/widgets/drawer.dart';
import 'package:flutter/material.dart';


class ExchangeRatePage extends StatefulWidget {
   
    ExchangeRatePage({Key? key}) : super(key: key);

  @override
  State<ExchangeRatePage> createState() => _ExchangeRatePageState();
}

class _ExchangeRatePageState extends State<ExchangeRatePage> {
    


  final _exchangeRates = JsonDecoder().convert(CRYPTO_EXCHANGE_RATES)['rates'].entries.toList();
  var _exchangeListFiltered  = [];
    @override
  initState(){
     _exchangeListFiltered = _exchangeRates;
    super.initState();
   }
    Widget build(BuildContext context) {
  //Filter the list

  filterRates(String query) {
    if (query.isEmpty) {
        _exchangeListFiltered = _exchangeRates;
    }
    var results = _exchangeRates.where((rate) => rate.key.toString().toLowerCase().contains(query.toLowerCase())).toList();
    setState(() {
      _exchangeListFiltered = results;
    });

  }
        return Scaffold(
            appBar: AppBar(
                title: const Text('Exchange Rate Page'),
                leading: Builder(
                    builder: (context) => IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                )
            ),
            body: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                children: [
                   Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: TextFormField(
                            onChanged: (value) => filterRates(value),
                            // controller: _textInputControl,
                            decoration: const InputDecoration(
                              labelText: 'Search',
                              hintText: 'Search',
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                              ),
                            ),
                          ),
                        ),
                  _exchangeListFiltered.isNotEmpty ? ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                      itemCount: _exchangeListFiltered.length,
                      separatorBuilder: (context, index) {
                          return const Divider();
                      },
                      itemBuilder: (context, index) {
                          return 
                              ListTile(
                                  title: Text(_exchangeListFiltered[index].key.toString().toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold), ),
                                  subtitle: Text(_exchangeListFiltered[index].value['name']),
                                  trailing: Text(_exchangeListFiltered[index].value['value'].toString()),

                              );
                      }
                  ) : const Center(child: Text('No results found'),)
                ],
              ),
            ),
            drawer: DrawerMenu(),
        );
    }
}
