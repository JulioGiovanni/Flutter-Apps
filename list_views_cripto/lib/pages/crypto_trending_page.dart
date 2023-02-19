import 'dart:convert';

import 'package:cripto_lists/widgets/drawer.dart';
import 'package:flutter/material.dart';

import '../data/constants.dart';

class CryptoTrendingPage extends StatefulWidget {
  const CryptoTrendingPage({Key? key}) : super(key: key);

  @override
  State<CryptoTrendingPage> createState() => _CryptoTrendingPageState();
}

class _CryptoTrendingPageState extends State<CryptoTrendingPage> {
  List _cryptoTrending = jsonDecode(CRYPTO_TRENDING)['coins'].toList();
  List _cryptoTrendingFiltered = [];

  @override
  initState() {
    _cryptoTrendingFiltered = _cryptoTrending;
    super.initState();
  }

  filterTrending(String query) {
    if (query.isEmpty) {
      _cryptoTrendingFiltered = _cryptoTrending;
    }
    var results = _cryptoTrending
        .where((rate) => rate['item']['id']
            .toString()
            .toLowerCase()
            .contains(query.toLowerCase()))
        .toList();
    setState(() {
      _cryptoTrendingFiltered = results;
    });
  }

  Widget build(BuildContext context) {
    print(_cryptoTrending);
    return Scaffold(
      appBar: AppBar(
        title: const Text('CryptoTrendingPage'),
        //Drawer
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                onChanged: (value) => filterTrending(value),
                decoration: InputDecoration(
                  labelText: 'Search',
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                ),
              ),
            ),
            _cryptoTrendingFiltered.isNotEmpty
                ? ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                            _cryptoTrendingFiltered[index]['item']['id']
                                .toString()
                                .toUpperCase(),
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _cryptoTrendingFiltered[index]['item']['name'],
                            ),
                            Text(
                                'value: ${_cryptoTrendingFiltered[index]['item']['price_btc']}'),
                          ],
                        ),
                        leading: Image.network(
                            _cryptoTrendingFiltered[index]['item']['large']),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: _cryptoTrendingFiltered.length)
                : Center(child: const Text('No results found'))
          ],
        ),
      ),
      drawer: DrawerMenu(),
    );
  }
}
