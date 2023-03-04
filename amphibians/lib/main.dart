import 'package:amphibians/presentation/screens/home_screen.dart';
import 'package:amphibians/providers/amphibian_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        title: 'Material App',
        home: ChangeNotifierProvider(
          create: (_) => AmphibiansProvider()..getAmphibians(),
          child: const HomeScreen(),
        ));

  }
}

//https://bit.ly/3XPPD2C
