import 'package:cripto_lists/pages/crypto_trending_page.dart';
import 'package:cripto_lists/pages/exchange_rate_page.dart';
import 'package:cripto_lists/pages/home_page.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('Menu'),
              
            ),
            ListTile(
              title: Text('Crypto Exchange Rates'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ExchangeRatePage()));
              },
            ),
            ListTile(
              title: Text('Crypto Exchange List'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            ListTile(
              title: Text('Crypto Trending'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CryptoTrendingPage()));
              },
            ),
            
          ],
        ),
      );
  }
}