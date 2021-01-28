import 'package:flutter/material.dart';
import 'package:platinumbetss/dashboard.dart';

void main() {
  runApp(MaterialApp(
      title: "Platinum Bets",
      home: Dashboard(),
      theme: ThemeData(
        primaryColor: Colors.blue[800],
        accentColor: Colors.teal[200],
        inputDecorationTheme: InputDecorationTheme(
          // Tema login
        )
      )));
}
