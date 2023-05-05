import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:softec/utils/routes.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
