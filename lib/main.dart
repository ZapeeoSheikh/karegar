import 'package:flutter/material.dart';
import 'package:softec/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: Routes.generateRoutes(),
      initialRoute: Routes.homePage,
    );
  }
}
