import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:platinumbetss/tela.login.dart';


class RegistroFinal extends StatefulWidget {
  @override
  _RegistroFinalState createState() => _RegistroFinalState();
}

class _RegistroFinalState extends State<RegistroFinal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/imagens/FundoLogin.jpg"),
              fit: BoxFit.cover,

            ),


          ),
          height: 760.0,


          padding: EdgeInsets.only(top: 60, left: 40, right:40,),

          child: Column(
            children: [
              SizedBox(
                height: 200.0,
              ),
              Container(
                child: Text(
                  "Quase lá",
                  style: TextStyle(color: Colors.white,
                      fontSize: 23.0),

                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: Text(
                    "Confirme seu e-mail para poder fazer login no app",
                    style: TextStyle(color: Colors.white60,
                        fontSize: 17.0)
                ),
              ),

              SizedBox(
                height: 10.0,
              ),








              SizedBox(
                height: 15.0,
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Container(
                    height: 50.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 5.0,
                          color: Colors.blue[800]
                      ),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight:Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),


                    child: FlatButton(
                      child: Text(
                        "Voltar",
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context) => TelaLogin(),
                            ));
                        },
                      color: Colors.blue[800],

                    ),
                  ),
                ),
              ),




            ],
          ),
        ),
      ),
    );
  }
}
