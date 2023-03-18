import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiptime/pages/home_page.dart';
import 'package:tiptime/provider/tip_provider.dart';

void main() => runApp(
    ChangeNotifierProvider(create: (_) => TipProvider(), child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        title: 'Material App',
        home: const HomePage());
  }
}
