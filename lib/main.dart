import 'package:flutter/material.dart';
import 'package:platinumbetss/dashboard.dart';
import 'package:platinumbetss/tela.login.dart';
import 'package:platinumbetss/tela.cadastro.dart';
import 'package:platinumbetss/recuperacao.senha.dart';
import 'package:platinumbetss/registro.final.dart';


void main() {
  runApp(MaterialApp(
      title: "Platinum Bets",
      home: TelaLogin(),
      theme: ThemeData(
        primaryColor: Colors.blue[800],
        accentColor: Colors.teal[200],
        inputDecorationTheme: InputDecorationTheme(
          // Tema login
        )
      )));
}
