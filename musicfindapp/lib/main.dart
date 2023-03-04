import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicfindapp/bloc/findmusic_bloc.dart';
import 'package:musicfindapp/presentation/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FindMusicBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //Change to dark theme
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
            primaryColor: Colors.purple,
            brightness: Brightness.dark,
            //Change to Material 3
            useMaterial3: true),
        title: 'Material App',

        home: const HomeScreen(),
      ),
    );
  }
}
