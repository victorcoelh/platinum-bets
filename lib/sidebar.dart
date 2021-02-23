import 'package:flutter/material.dart';
import 'package:platinumbetss/tela.login.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'apostas.dart';
import 'modelos/user_model.dart';

class Sidebar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  final int _options = 4;
  List<String> _sideOptions = ["Adicionar Fundos", "Configurações", "Ajuda", "Esportes"];
  TextStyle tligas = TextStyle(fontSize: 16.0);

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
                      return _listBuild(index);
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

  Widget _listBuild(int index) {
    bool initial = (index == 3);
    IconButton icon = IconButton(
        icon: Icon(
          Icons.keyboard_arrow_down,
          size: 32.0,
          color: Colors.grey[700],
        ),
        onPressed: null);

    if (initial) {
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
                onPressed: () {},
              ),
              FlatButton(
                child: Text("Premier League",
                    style: tligas, textAlign: TextAlign.start),
                onPressed: () {},
              ),
              FlatButton(
                child: Text("NBA", style: tligas, textAlign: TextAlign.start),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Apostas()));
                },
              )
            ],
          ),
        ),
      );
    }
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(30.0, 0.0, 20.0, 0.0),
      title: Text(
        _sideOptions[index],
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }
}
