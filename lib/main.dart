import 'package:app_demo/pages/login.page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Teste',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: Home(),
    );
  }
}
