import 'package:flutter/material.dart';
import 'package:platinumbetss/tela.login.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'apostas.dart';
import 'modelos/user_model.dart';
import 'info.dart';
import 'dashboard.dart';

class Sidebar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  final int _options = 4;
  List<String> _sideOptions = [
    "Adicionar Fundos",
    "Configurações",
    "Ajuda",
    "Esportes"
  ];
  TextStyle tligas = TextStyle(fontSize: 16.0);
  TextEditingController quantia = TextEditingController();

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

      return Container(
        padding: EdgeInsets.all(0),
        color: Colors.white,
        width: 350.0,
        height: double.infinity,
        child: Drawer(
            child: Column(
          children: [
            SizedBox(
                height: 250.0,
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/imagens/Gigachad.jpg",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      alignment: Alignment.topCenter,
                    ),
                    Image.asset(
                      "assets/imagens/DegradePerfil.png",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      alignment: Alignment.topCenter,
                    ),
                  ],
                )),
            Container(
              height: 40.0,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Text(
                      "${model.userData['nome']}",
                      style: TextStyle(color: Colors.white, fontSize: 21.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 30.0),
                    child: Text(
                      "R\$${model.userData['saldo']}",
                      style: TextStyle(color: Colors.white, fontSize: 21.0),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(color: Colors.teal, boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(-2, 2))
              ]),
            ),
            Container(
                height: 420.0,
                child: ListView.builder(
                    itemCount: _options,
                    itemBuilder: (context, index) {
                      return _listBuild(index, model);
                    })),
            Divider(color: Colors.grey[700]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: ScopedModelDescendant<UserModel>(
                    builder: (context, child, model) {
                      return Row(
                        children: [
                          IconButton(
                              icon: Icon(Icons.logout),
                              onPressed: () {
                                model.Sair();
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => TelaLogin()));
                              }),
                          FlatButton(
                              child: Text(
                                "Logout",
                                style: TextStyle(fontSize: 20.0),
                              ),
                              onPressed: () {
                                model.Sair();

                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => TelaLogin()));
                              }),
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 14.0),
                  child: Text("versão 0.1",
                      style: TextStyle(color: Colors.grey, fontSize: 14.0)),
                )
              ],
            )
          ],
        )),
      );
    });
  }

  Widget _listBuild(int index, UserModel mod) {
    bool initial = (index == 3);
    IconButton icon = IconButton(
        icon: Icon(
          Icons.keyboard_arrow_down,
          size: 32.0,
          color: Colors.grey[700],
        ),
        onPressed: null);

    switch (index) {
      case 3:
        return ListTile(
          contentPadding: EdgeInsets.fromLTRB(30.0, 0.0, 20.0, 0.0),
          title: ExpandablePanel(
            header: Text(
              "Ligas",
              style: TextStyle(fontSize: 20.0),
            ),
            collapsed: Container(),
            expanded: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FlatButton(
                  child: Text(
                    "Brasileirão Série A",
                    style: tligas,
                    textAlign: TextAlign.start,
                  ),
                  onPressed: () {
                    TeamData.esporte = 'futebol';
                    TeamData.liga = 'brSerieA';
                    TeamData.getNames();
                    TeamData.getLogos();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Apostas()));
                  },
                ),
                FlatButton(
                  child: Text("Premier League",
                      style: tligas, textAlign: TextAlign.start),
                  onPressed: () {
                    TeamData.esporte = 'futebol';
                    TeamData.liga = 'premierLeague';
                    TeamData.getNames();
                    TeamData.getLogos();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Apostas()));
                  },
                ),
                FlatButton(
                  child: Text("NBA", style: tligas, textAlign: TextAlign.start),
                  onPressed: () {
                    TeamData.esporte = 'basquete';
                    TeamData.liga = 'nba';
                    TeamData.getNames();
                    TeamData.getLogos();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Apostas()));
                  },
                )
              ],
            ),
          ),
        );
      case 0:
        return ListTile(
            contentPadding: EdgeInsets.fromLTRB(30.0, 0.0, 20.0, 0.0),
            leading: FlatButton(
                padding: EdgeInsets.zero,
                child: Text(
                  "Dashboard",
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.start,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Dashboard()));
                }));
      case 1:
        return ListTile(
          contentPadding: EdgeInsets.fromLTRB(30.0, 0.0, 20.0, 0.0),
          leading: FlatButton(
            padding: EdgeInsets.zero,
            child: Text(
              "Adicionar Fundos",
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.start,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Insira a quantia a ser adicionada"),
                      content: TextField(
                        controller: quantia,
                        decoration: InputDecoration(prefixText: "R\$"),
                      ),
                      actions: [
                        FlatButton(
                          child: Text(
                            "Cancelar",
                            style: TextStyle(color: Colors.blue[800]),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        FlatButton(
                          child: Text(
                            "Confirmar",
                            style: TextStyle(color: Colors.blue[800]),
                          ),
                          onPressed: () {
                            Firestore.instance
                                .collection('users')
                                .document(mod.firebaseUser.uid)
                                .updateData({
                              'saldo': mod.userData['saldo'] +
                                  int.parse(quantia.text)
                            });
                            mod.DataUpdate();
                            Navigator.pop(context);
                          },
                        )
                      ],
                    );
                  });
            },
          ),
        );
      case 2:
        return ListTile(
          contentPadding: EdgeInsets.fromLTRB(14.0, 0.0, 20.0, 10.0),
          leading: FlatButton(
            padding: EdgeInsets.zero,
            child: Text(
              "Ajuda",
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.start,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Contato"),
                      content: Text(
                        "E-mail: platinumbets11@gmail.com\nTelefone: (85)992256637",
                        style: TextStyle(
                          fontSize: 16.0
                        ),
                      ),
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
            },
          ),
        );
      default:
        return ListTile(
          contentPadding: EdgeInsets.fromLTRB(30.0, 0.0, 20.0, 0.0),
          title: Text(_sideOptions[index], style: TextStyle(fontSize: 20.0)),
        );
    }
  }
}
