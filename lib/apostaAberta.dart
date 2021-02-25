import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:platinumbetss/modelos/user_model.dart';
import 'info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ApostaAberta extends StatefulWidget {
  @override
  _ApostaAbertaState createState() => _ApostaAbertaState();
}

class _ApostaAbertaState extends State<ApostaAberta> {
  TextStyle estilot = TextStyle(fontSize: 28.0);
  TextStyle estilob = TextStyle(fontSize: 20.0);
  TextEditingController controlePreco = TextEditingController();

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

      return FutureBuilder(
          future: Future.delayed(Duration(seconds: 1)),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done){
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
                          Text("0.8", style: estilot),
                          Text("0.0", style: estilot),
                          Text("0.2", style: estilot)
                        ],
                      )
                    ],
                  ),
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Escolha o valor da aposta"),
                              content: SizedBox(
                                  height: 100,
                                  child: Column(
                                    children: [
                                      Text("Odds: 80%, payout: 20%"),
                                      TextField(
                                        controller: controlePreco,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(prefixText: "R\$"),
                                      )
                                    ],
                                  )),
                              actions: [
                                FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Cancelar")),
                                FlatButton(
                                    onPressed: () {
                                      int novoSaldo = model.userData['saldo'] -
                                          int.parse(controlePreco.text);
                                      if (novoSaldo < 0) {
                                        showFailDialog("Saldo insuficiente");
                                      } else {
                                        Firestore.instance
                                            .collection("users")
                                            .document(model.firebaseUser.uid)
                                            .updateData({'saldo': (novoSaldo)});
                                        Firestore.instance
                                            .collection("users")
                                            .document(model.firebaseUser.uid)
                                            .collection('apostas')
                                            .add({
                                          'valor' : controlePreco.text,
                                          'time' : TeamData.nomes[TeamData.ind * 2],
                                          'oponente' : TeamData.nomes[TeamData.ind * 2 + 1],
                                          'payout' : 1.2
                                        });
                                        model.DataUpdate();
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: Text("Confirmar"))
                              ],
                            );
                          },
                        );
                      },
                      child: Text(
                        "Casa",
                        style: estilob,
                      )),
                  FlatButton(
                    child: Text("Empate", style: estilob),
                    onPressed: () {
                      showFailDialog("Opção indisponível nesta liga");
                    },
                  ),
                  FlatButton(onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Escolha o valor da aposta"),
                          content: SizedBox(
                              height: 100,
                              child: Column(
                                children: [
                                  Text("Odds: 20%, payout: 80%"),
                                  TextField(
                                    controller: controlePreco,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(prefixText: "R\$"),
                                  )
                                ],
                              )),
                          actions: [
                            FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Cancelar")),
                            FlatButton(
                                onPressed: () {
                                  int novoSaldo = model.userData['saldo'] -
                                      int.parse(controlePreco.text);
                                  if (novoSaldo < 0) {
                                    showFailDialog("Saldo insuficiente");
                                  } else {
                                    Firestore.instance
                                        .collection("users")
                                        .document(model.firebaseUser.uid)
                                        .updateData({'saldo': (novoSaldo)});
                                    Firestore.instance
                                        .collection("users")
                                        .document(model.firebaseUser.uid)
                                        .collection('apostas')
                                        .add({
                                      'valor' : controlePreco.text,
                                      'time' : TeamData.nomes[TeamData.ind * 2 + 1],
                                      'oponente' : TeamData.nomes[TeamData.ind * 2],
                                      'payout' : 1.2
                                    });
                                    model.DataUpdate();
                                    Navigator.pop(context);
                                  }
                                },
                                child: Text("Confirmar"))
                          ],
                        );
                      },
                    );
                  }, child: Text("Fora", style: estilob))
                ],
              );
            } else {
              return Center(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(
                  ),
                ),
              );
            }
      });
    });
  }

  void showFailDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(message),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Ok"))
          ],
        );
      },
    );
  }
}
