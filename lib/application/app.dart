import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
 
  const MyApp._create();
  static final instance = MyApp._create();

  factory MyApp() => instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}