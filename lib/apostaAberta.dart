import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:platinumbetss/modelos/user_model.dart';
import 'info.dart';

class ApostaAberta extends StatefulWidget {
  @override
  _ApostaAbertaState createState() => _ApostaAbertaState();
}

class _ApostaAbertaState extends State<ApostaAberta> {
  TextStyle estilot = TextStyle(fontSize: 28.0);
  TextStyle estilob = TextStyle(fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(builder: (context, child, model) {
      if (model.Isloading)
        return Stack(
          children: [
            Image.asset(
              "assets/imagens/FundoLogin.jpg",
              fit: BoxFit.cover,
              height: 1000.0,
            ),
            Center(
              child: CircularProgressIndicator(),
            )
          ],
        );

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
                    "${TeamData.logos[TeamData.ind * 2]}",
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 110,
                  width: 110,
                  child: Image.asset(
                    "${TeamData.logos[TeamData.ind * 2 + 1]}",
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
    });
  }
}
