import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'sidebar.dart';
import 'apostaAberta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'info.dart';

class Apostas extends StatefulWidget {
  @override
  _ApostasState createState() => _ApostasState();
}

class _ApostasState extends State<Apostas> {
  /*DocumentSnapshot partidas;
  int size = 3;
  List<String> nomes;
  List<String> logos;

  void getLogos() async {
    for (int i = 0; i < size; i++) {
      Firestore.instance
          .collection('esportes')
          .document('basquete')
          .collection('nba')
          .where('nome', isEqualTo: nomes[i])
          .snapshots()
          .listen((event) {
        logos[i] = event.documents[0]['logo'];
        print(logos[i]);
      });
    }
  }

  void getNames() async {
    Firestore.instance
        .collection("esportes")
        .document("basquete")
        .collection("nba")
        .document("partidas")
        .snapshots()
        .listen((event) {
      size = event['confrontos'].length;
      nomes = new List<String>(size);
      logos = new List<String>(size);
      for(int i = 0; i < size; i++){
        nomes[i] = event['confrontos'][i];
        print(nomes[i]);
      }
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          /*leading: IconButton(
          icon: Icon(Icons.menu, size: 32,),
          onPressed: () {},
        ),*/
          title: Text("Apostas"),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.refresh, size: 32),
              onPressed: () {},
            ),
          ],
        ),
        drawer: Sidebar(),
        body: Container(
          color: Colors.blueGrey[900],
          height: double.infinity,
          width: double.infinity,
          child: ListView.builder(
              itemCount: (TeamData.size / 2).ceil(),
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              itemBuilder: (context, index) {
                TeamData.getNames();
                TeamData.getLogos();
                return Card(
                    color: Colors.blueGrey[50],
                    margin:
                        EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.5),
                    child: InkWell(
                      splashColor: Colors.blue[800].withAlpha(30),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            TeamData.ind = index;
                            return ApostaAberta();
                          },
                        );
                      },
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              Opacity(
                                opacity: 0.7,
                                child: Image.asset(
                                  "assets/imagens/Quadra.jpg",
                                  fit: BoxFit.cover,
                                  height: 100.0,
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 85,
                                    width: 85,
                                    child: Image.asset(
                                      '${TeamData.logos[index * 2]}',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 85,
                                    width: 85,
                                    child: Image.asset(
                                      '${TeamData.logos[index * 2 + 1]}',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          //Padding(padding: EdgeInsets.only(left: 0.0)),
                          Expanded(child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${TeamData.nomes[index * 2]}\n${TeamData.nomes[index * 2 + 1]}",
                                      style: TextStyle(fontSize: 16.0),
                                      textAlign: TextAlign.center,
                                    ),
                                    Divider(
                                      color: Colors.transparent,
                                    ),
                                    Text("H: 80% | E: 0% | A: 20%",
                                        style: TextStyle())
                                  ],
                                ),
                              )
                            ],
                          )
                          )],
                      ),
                    ));
              }),
        ));
  }
}