import 'package:flutter/material.dart';
import 'package:platinumbetss/sidebar.dart';
import 'package:platinumbetss/favoritos.dart';
import 'ultimas.dart';
import 'apostas.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scoped_model/scoped_model.dart';
import 'modelos/user_model.dart';
import 'apostaRapida.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  DocumentSnapshot partidas;
  QuerySnapshot time1;
  QuerySnapshot time2;
  String filtro1;
  String filtro2;

  void getTeams(String filtro1, String filtro2) async {
    Firestore.instance
        .collection('esportes')
        .document('basquete')
        .collection('nba')
        .where('nome', isEqualTo: filtro1)
        .snapshots()
        .listen((event) {
      print(event.documents[0]['logo']);
    });
    Firestore.instance
        .collection('esportes')
        .document('basquete')
        .collection('nba')
        .where('nome', isEqualTo: filtro2)
        .snapshots()
        .listen((event) {
      print(event.documents[0]['logo']);
    });
  }

  void getPartidas(int i) async {
    Firestore.instance
        .collection("esportes")
        .document("basquete")
        .collection("nba")
        .document("partidas")
        .snapshots()
        .listen((event) {
      filtro1 = event['confrontos'][i - 1];
      filtro2 = event['confrontos'][i];
      print(filtro1);
      print(filtro2);
    });
  }

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
            /*leading: IconButton(
          icon: Icon(Icons.menu, size: 32,),
          onPressed: () {},
        ),*/
            title: Text("Dashboard"),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.refresh, size: 32),
                onPressed: () {
                  model.DataUpdate();
                },
              ),
            ],
          ),
          drawer: Sidebar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      "assets/imagens/comemorar.jpg",
                      fit: BoxFit.cover,
                      height: 400.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Bem-vindo\nnovamente,\nusuário",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 36.0,
                              fontWeight: FontWeight.normal,
                              shadows: [
                                Shadow(
                                  offset: Offset(0.0, 2.0),
                                  blurRadius: 3.0,
                                  color: Colors.black38,
                                )
                              ]),
                        ),
                        Divider(
                          thickness: 15,
                          color: Colors.transparent,
                        ),
                        SizedBox(
                          width: 200.0,
                          height: 50.0,
                          child: RaisedButton(
                              color: Colors.teal[200],
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return ApostaRapida();
                                  },
                                );
                              },
                              child: Text("APOSTA RÁPIDA")),
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    AppBar(
                      title: Text("Times Favoritos"),
                      centerTitle: true,
                    ),
                    Container(
                      height: 500.0,
                      child: StreamBuilder(
                        stream: Firestore.instance
                            .collection('users')
                            .document(model.firebaseUser.uid)
                            .collection('favoritos')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data.documents.length,
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                                itemBuilder: (context, index) {
                                  return Column(children: [
                                    ListTile(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 0.0, horizontal: 0.0),
                                      title: Text(snapshot.data.documents[index]
                                          ['nome']),
                                      subtitle: Text(snapshot
                                          .data.documents[index]['NextMatch']),
                                      trailing: SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: Container()),
                                      leading: SizedBox(
                                        height: 80,
                                        width: 80,
                                        child: Image.asset(
                                          snapshot.data.documents[index]
                                              ['logo'],
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    ),
                                    Divider()
                                  ]);
                                });
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                      width: double.infinity,
                      child: RaisedButton(
                        color: Colors.teal[200],
                        child: Icon(Icons.keyboard_arrow_down),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Favoritos(),
                              ));
                        },
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    AppBar(
                      title: Text("Últimas apostas"),
                      centerTitle: true,
                    ),
                    Container(
                      height: 500.0,
                      child: StreamBuilder(
                        stream: Firestore.instance
                            .collection('users')
                            .document(model.firebaseUser.uid)
                            .collection('apostas')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data.documents.length,
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                                itemBuilder: (context, index) {
                                  return Column(children: [
                                    ListTile(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 0.0, horizontal: 10.0),
                                      title: Text(snapshot.data.documents[index]
                                          ['time']),
                                      subtitle: Text(snapshot
                                          .data.documents[index]['oponente']),
                                      trailing: Text(
                                        'R\$${snapshot.data.documents[index]['valor']}',
                                        style: TextStyle(fontSize: 18.0),
                                      ),
                                    ),
                                    Divider()
                                  ]);
                                });
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                      width: double.infinity,
                      child: RaisedButton(
                        color: Colors.teal[200],
                        child: Icon(Icons.keyboard_arrow_down),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Ultimas(),
                              ));
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ));
    });
  }
}
