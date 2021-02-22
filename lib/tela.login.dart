import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platinumbetss/dashboard.dart';
import 'package:platinumbetss/recuperacao.senha.dart';
import 'package:platinumbetss/tela.cadastro.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
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
                height: 260.0,
              ),
              Container(
                child: Text(
                  "Seja bem vindo(a)",
                  style: TextStyle(color: Colors.white,
                  fontSize: 30.0),

                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: Text(
                  "Insira suas credenciais",
                    style: TextStyle(color: Colors.white60,
                        fontSize: 17.0)
                ),
              ),
              SizedBox(
                height: 20.0,
              ),

              Container(
                child: Text(
                    "(CPF ou E-mail)",
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

                      labelText: "    CPF/Email",
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
              Row(
                children: [
                  Text(
                    " Lembrar usuário",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15.0
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  FlatButton(


                    child: Text(
                      "Esqueceu sua senha?",
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.white60,
                          fontSize: 15.0),

                    ),
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => RecuperacaoSenha(),
                          ));
                      },
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                  children:[
                    SizedBox(
                      width: 20.0,
                    ),

                    Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Container(
                        height: 50.0,
                        width: 140.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 5.0,
                              color: Colors.blue[800]
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft:Radius.circular(20),
                          ),
                        ),


                        child: FlatButton(
                          child: Text(
                            "Entrar",
                            style: TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(
                                  builder: (context) => Dashboard(),
                                ));
                          },
                          color: Colors.blue[800],

                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Container(
                        height: 50.0,
                        width: 140.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 5.0,
                            color: Colors.blue[800]
                          ),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight:Radius.circular(20),
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
                                  builder: (context) => TelaCadastro(),
                                ));
                          },
                          color: Colors.blue[800],

                        ),
                      ),
                    ),
                  ]
              ),



            ],
          ),
        ),
      ),
    );

  }
}
