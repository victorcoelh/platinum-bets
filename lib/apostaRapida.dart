import 'package:flutter/material.dart';

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
              decoration: InputDecoration(
                labelText: "time",
                labelStyle: TextStyle()
              ),
              style: TextStyle(),
            )
          ],
        ),
      ),
      actions: [
        FlatButton(onPressed: () {}, child: Text("Confirmar"))
      ]
    );
  }
}

