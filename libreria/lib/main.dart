import 'package:flutter/material.dart';
import 'package:libreria/router/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:libreria/providers/library_provider.dart';



void main() => runApp(const AppState());

  class AppState extends StatelessWidget {
    const AppState({ Key? key }) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => LibraryProvider(),lazy: false,),
        ],
        child: const MyApp()
      );
    }
  }


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}