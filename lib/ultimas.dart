import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'sidebar.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:platinumbetss/modelos/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Ultimas extends StatefulWidget {
  @override
  _UltimasState createState() => _UltimasState();
}

class _UltimasState extends State<Ultimas> {


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
                  child: StreamBuilder(
                    stream: Firestore.instance
                        .collection('users')
                        .document(model.firebaseUser.uid)
                        .collection('apostas')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data.documents.length,
                            padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                            itemBuilder: (context, index) {
                              return Column(children: [
                                ListTile(
                                  contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                                  title:
                                  Text(snapshot.data.documents[index]['time']),
                                  subtitle: Text(
                                      snapshot.data.documents[index]['oponente']),
                                  trailing: Text('R\$${snapshot.data.documents[index]['valor']}',
                                  style: TextStyle(fontSize: 18.0),),
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
}
