import 'dart:convert';

import 'package:cripto_lists/data/constants.dart';
import 'package:cripto_lists/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _cryptoExchanges = JsonDecoder().convert(CRYPTO_EXCHANGES).toList();
  var _exchangeCryptosFiltered  = [];
    @override
  initState(){
     _exchangeCryptosFiltered = _cryptoExchanges;
    super.initState();
   }

   filterCurrencies(String query) {
    if (query.isEmpty) {
        _exchangeCryptosFiltered = _cryptoExchanges;
    }
    var results = _cryptoExchanges.where((rate) => rate['id'].toString().toLowerCase().contains(query.toLowerCase())).toList();
    setState(() {
      _exchangeCryptosFiltered = results;
    });

  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crypto APP"),
        //Drawer
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                onChanged: (value) => filterCurrencies(value),
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
            _exchangeCryptosFiltered.isNotEmpty ? ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _exchangeCryptosFiltered.length,
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemBuilder: (context, index) {
                  return  ListTile(
                    title: Text(_exchangeCryptosFiltered[index]["name"]),
                    leading: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Image.network(_exchangeCryptosFiltered[index]["image"])),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${_exchangeCryptosFiltered[index]["country"]}'),
                        Text('${_exchangeCryptosFiltered[index]["year_established"]}'),
                      ],
                    ),
                    trailing: CircleAvatar(
                      child: Text(
                        '${_exchangeCryptosFiltered[index]["trust_score"]}',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.black,
                    ),
                  ) ;
                }) : Center(child: Text("No results found")),
          ],
        ),
      ),
      drawer: DrawerMenu(),
    );
  }
}
