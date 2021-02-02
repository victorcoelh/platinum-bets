

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platinumbetss/registro.final.dart';

class TelaCadastro extends StatefulWidget {
  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
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
                height: 80.0,
              ),
              Container(
                child: Text(
                  "Seja bem vindo(a)",
                  style: TextStyle(color: Colors.white,
                      fontSize: 20.0),

                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: Text(
                    "Complete suas credenciais",
                    style: TextStyle(color: Colors.white60,
                        fontSize: 17.0)
                ),
              ),

              SizedBox(
                height: 10.0,
              ),






              Container(


                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 3.0,
                      color: Colors.blue[800],


                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20.0))
                ),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,

                  decoration: InputDecoration(

                      labelText: "    Email",
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0
                      )
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),

              Container(


                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 3.0,
                      color: Colors.blue[800],


                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20.0))
                ),
                child: TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.text,

                  decoration: InputDecoration(

                      labelText: "    Senha",
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0
                      )
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(


                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 3.0,
                      color: Colors.blue[800],


                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20.0))
                ),
                child: TextFormField(
                  keyboardType: TextInputType.number,

                  decoration: InputDecoration(

                      labelText: "    CPF",
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0
                      )
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(


                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 3.0,
                      color: Colors.blue[800],


                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20.0))
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,

                  decoration: InputDecoration(

                      labelText: "    Nome",
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0
                      )
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(


                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 3.0,
                      color: Colors.blue[800],


                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20.0))
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,

                  decoration: InputDecoration(

                      labelText: "    Sobrenome",
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0
                      )
                  ),
                ),
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
                        "Registrar",
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context) => RegistroFinal(),
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
