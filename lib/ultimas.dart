import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'sidebar.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:platinumbetss/modelos/user_model.dart';

class Ultimas extends StatefulWidget {
  @override
  _UltimasState createState() => _UltimasState();
}

class _UltimasState extends State<Ultimas> {
  List<String> _lista = [
    "Atlanta Hawks",
    "Milwaukee Bucks",
    "Brooklyn Nets",
    "Los Angeles Lakers",
    "Golden State Warriors",
    "Philadelphia 76ers",
    "Miami Heat",
    "Dallas Mavericks",
    "Houston Rockets"
  ];

  List<String> _listadois = [
    "Jogo",
    "Jogo",
    "Jogo",
    "Jogo",
    "Jogo",
    "Jogo",
    "Jogo",
    "Jogo",
    "Jogo",
  ];

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

      return Scaffold(
          appBar: AppBar(
            title: Text("Ultimas Apostas"),
            centerTitle: true,
          ),
          drawer: Sidebar(),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _lista.length,
                    padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                    itemBuilder: (context, index) {
                      return Column(children: [
                        ListTile(
                            title: Text(_listadois[index]),
                            subtitle: Text("adiado"),
                            trailing: Text("acerto")),
                        Divider()
                      ]);
                    }),
              ),
              SizedBox(
                height: 40.0,
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.teal[200],
                  child: Icon(Icons.keyboard_arrow_up),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Dashboard(),
                        ));
                  },
                ),
              )
            ],
          ));
    });
  }
}
