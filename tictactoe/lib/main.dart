import 'package:flutter/material.dart';
import 'package:tictactoe/tictachome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TICTACTOE',
      debugShowCheckedModeBanner: false,
      home: TicTacHome(),
    );
  }
}
