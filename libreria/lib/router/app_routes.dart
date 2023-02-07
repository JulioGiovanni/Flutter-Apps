
import 'package:flutter/material.dart';
import 'package:libreria/models/router_options.dart';
import 'package:libreria/pages/home_page.dart';
import 'package:libreria/pages/result_page.dart';


class AppRoutes {
  static const initialRoute = 'home';
  //Manera de definir las rutas de la aplicacion
  static final menuOptions = <RouteOptions>[
    RouteOptions(route: 'resultPage', name: 'Detalles', screen: const ResultPage()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (context) => const HomePage()});
    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }
    // menuOptions.forEach((menuOption) => appRoutes[menuOption.route] = (context) => menuOption.screen);

    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const HomePage());
  }
}
