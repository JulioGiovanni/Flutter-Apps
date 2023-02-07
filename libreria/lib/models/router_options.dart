import 'package:flutter/material.dart' show  Widget;

class RouteOptions {
  final String route;
  final String name;
  final Widget screen;

  RouteOptions(
      {required this.route,
      required this.name,
      required this.screen});
}
