import 'package:fe_store/config/routes.dart';
import 'package:fe_store/config/theme_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      title: "Fe-Store",
      routes: routes,
      initialRoute: "/",
    );
  }
}
