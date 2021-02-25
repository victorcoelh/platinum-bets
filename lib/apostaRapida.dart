import 'package:flutter/material.dart';
import 'package:platinumbetss/apostaAberta.dart';
import 'info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ApostaRapida extends StatefulWidget {
  @override
  _ApostaRapidaState createState() => _ApostaRapidaState();
}

class _ApostaRapidaState extends State<ApostaRapida> {
  String dropdownValue = "Brasileirão";
  TextEditingController teamController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: SizedBox(
          height: 125.0,
          child: Column(
            children: [
              DropdownButton<String>(
                value: dropdownValue,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.blue[800]),
                underline: Container(
                  height: 2,
                  color: Colors.blue[800],
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                  if (dropdownValue != 'NBA') {
                    if (dropdownValue != 'Brasileirão') {
                      TeamData.liga = 'premierLeague';
                      TeamData.esporte = 'futebol';
                    } else {
                      TeamData.liga = 'brSerieA';
                      TeamData.esporte = 'futebol';
                    }
                  } else {
                    TeamData.liga = 'nba';
                    TeamData.esporte = 'basquete';
                  }
                  TeamData.getNames();
                  TeamData.getLogos();
                },
                items: <String>['Brasileirão', 'Premier League', 'NBA']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              TextField(
                controller: teamController,
                decoration:
                    InputDecoration(labelText: "time", labelStyle: TextStyle()),
                style: TextStyle(),
              )
            ],
          ),
        ),
        actions: [
          FlatButton(
              onPressed: () {
                if (dropdownValue != 'NBA') {
                  if (dropdownValue != 'Brasileirão') {
                    TeamData.liga = 'premierLeague';
                    TeamData.esporte = 'futebol';
                  } else {
                    TeamData.liga = 'brSerieA';
                    TeamData.esporte = 'futebol';
                  }
                } else {
                  TeamData.liga = 'nba';
                  TeamData.esporte = 'basquete';
                }
                TeamData.getNames();
                TeamData.getLogos();
                if(TeamData.nomes.contains(teamController.text)){
                  TeamData.ind = (TeamData.nomes.indexOf(teamController.text) / 2).floor();
                  print(teamController.text);
                  print(TeamData.nomes);
                  showDialog(context: context,
                  builder: (BuildContext context) {
                    return ApostaAberta();
                  });
                } else {
                  print(teamController.text);
                  print(TeamData.nomes);
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Esse time não irá jogar na próxima rodada!"),
                          actions: [
                            FlatButton(
                              child: Text(
                                "Ok",
                                style: TextStyle(color: Colors.blue[800]),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      });
                }
              },
              child: Text("Confirmar"))
        ]);
  }
}
