import 'package:flutter/material.dart';
import 'package:icon_shadow/icon_shadow.dart';

class ApostaAberta extends StatefulWidget {
  @override
  _ApostaAbertaState createState() => _ApostaAbertaState();
}

class _ApostaAbertaState extends State<ApostaAberta> {
  TextStyle estilot = TextStyle(fontSize: 28.0);
  TextStyle estilob = TextStyle(fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 38.0),
      titlePadding: EdgeInsets.zero,
      title: Container(
          color: Colors.blue[800],
          width: 300.0,
          height: 160.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 110,
                width: 110,
                child: Image.asset(
                  "assets/imagens/times/nba/Atlanta-Hawks.png",
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 110,
                width: 110,
                child: Image.asset(
                  "assets/imagens/times/nba/Denver-Nuggets.png",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          )),
      content: SizedBox(
        height: 125.0,
        width: 300.0,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 50.0),
              child: Text(
                "ODDS",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("0.4", style: estilot),
                Text("0.2", style: estilot),
                Text("0.4", style: estilot)
              ],
            )
          ],
        ),
      ),
      actions: [
        FlatButton(
            onPressed: () {},
            child: Text(
              "Casa",
              style: estilob,
            )),
        FlatButton(onPressed: () {}, child: Text("Empate", style: estilob)),
        FlatButton(onPressed: () {}, child: Text("Fora", style: estilob))
      ],
    );
  }
}
