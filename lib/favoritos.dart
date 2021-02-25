import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'sidebar.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:platinumbetss/modelos/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Favoritos extends StatefulWidget {
  @override
  _FavoritosState createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> {
  String dropdownValue = 'Brasileirão';

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
            title: Text("Times Favoritos"),
            centerTitle: true,
            actions: [
              IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return _addTeam(model.firebaseUser.uid);
                      },
                    );
                  })
            ],
          ),
          drawer: Sidebar(),
          body: Column(
            children: [
              Expanded(
                  child: StreamBuilder(
                stream: Firestore.instance
                    .collection('users')
                    .document(model.firebaseUser.uid)
                    .collection('favoritos')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data.documents.length,
                        padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                        itemBuilder: (context, index) {
                          return Column(children: [
                            ListTile(
                              contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                              title:
                                  Text(snapshot.data.documents[index]['nome']),
                              subtitle: Text(
                                  snapshot.data.documents[index]['NextMatch']),
                              trailing: SizedBox(
                                  height: 40, width: 40, child: Container()),
                              leading: SizedBox(
                                height: 80,
                                width: 80,
                                child: Image.asset(
                                    snapshot.data.documents[index]['logo'],
                                fit: BoxFit.scaleDown,),
                              ),
                            ),
                            Divider()
                          ]);
                        });
                  } else {
                    return Container();
                  }
                },
              )),
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

  Widget _addTeam(String id) {
    String liga;
    String esporte;
    TextEditingController teamController = TextEditingController();
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
                  esporte = 'futebol';
                  if (dropdownValue != 'Premier League') {
                    liga = 'brSerieA';
                  } else {
                    liga = 'premierLeague';
                  }
                } else {
                  esporte = 'basquete';
                  liga = 'nba';
                }
                _addT(teamController.text, liga, esporte, id);
                Navigator.pop(context);
              },
              child: Text("Confirmar"))
        ]);
  }

  void _addT(String nome, String liga, String esporte, String id) async {
    await Firestore.instance
        .collection('esportes')
        .document(esporte)
        .collection(liga)
        .where('nome', isEqualTo: nome)
        .snapshots()
        .first
        .then((d) => {
              Firestore.instance
                  .collection('users')
                  .document(id)
                  .collection('favoritos')
                  .add(d.documents.first.data)
            });
  }
}
