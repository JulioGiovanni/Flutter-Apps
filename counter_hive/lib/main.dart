import 'package:counter_hive/presentation/providers/counter_provider.dart';
import 'package:counter_hive/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterProvider()..loadCounter(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        //Change background color
        scaffoldBackgroundColor: const Color.fromRGBO(229, 247, 237, 1),
        //Change color of the appbar
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(229, 247, 237, 1),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
