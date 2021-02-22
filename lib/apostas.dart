import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'sidebar.dart';
import 'apostaAberta.dart';

class Apostas extends StatefulWidget {
  @override
  _ApostasState createState() => _ApostasState();
}

class _ApostasState extends State<Apostas> {
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
              itemCount: 20,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Card(
                      color: Colors.blueGrey[50],
                        margin: EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 2.5),
                        child: InkWell(
                            splashColor: Colors.blue[800].withAlpha(30),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return ApostaAberta();
                                },
                              );
                            },
                            child: Stack(
                              children: [
                                Opacity(
                                  opacity: 0.7,
                                  child: Image.asset("assets/imagens/Quadra.jpg",
                                    fit: BoxFit.cover,
                                    height: 100.0,),
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: 85,
                                          width: 85,
                                          child: Image.asset(
                                            "assets/imagens/times/nba/Atlanta-Hawks.png",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 85,
                                          width: 85,
                                          child: Image.asset(
                                            "assets/imagens/times/nba/Denver-Nuggets.png",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          30.0, 10.0, 0.0, 5.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Atlanta Hawks\nx Denver Nuggets",
                                            style: TextStyle(fontSize: 18.0),
                                            textAlign: TextAlign.center,
                                          ),
                                          Divider(
                                            color: Colors.transparent,
                                          ),
                                          Text("H: 0.8 | E: 0.1 | A: 0.1",
                                              style: TextStyle())
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )))
                  ],
                );
              }),
        ));
  }
}
