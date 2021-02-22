import 'package:flutter/material.dart';
import 'package:platinumbetss/modelos/user_model.dart';
import 'package:platinumbetss/registro.final.dart';
import 'package:platinumbetss/tela.login.dart';
import 'package:scoped_model/scoped_model.dart';

class RecuperacaoSenha extends StatefulWidget {
  @override
  _RecuperacaoSenhaState createState() => _RecuperacaoSenhaState();
}

class _RecuperacaoSenhaState extends State<RecuperacaoSenha> {

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: ScopedModelDescendant<UserModel>(
          builder: (context, child, model){
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/imagens/FundoLogin.jpg"),
                  fit: BoxFit.cover,

                ),


              ),
              height: 860.0,


              padding: EdgeInsets.only(top: 60, left: 40, right:40,),

              child: Column(
                children: [
                  SizedBox(
                    height: 200.0,
                  ),
                  Container(
                    child: Text(
                      "Esqueci minha senha",
                      style: TextStyle(color: Colors.white,
                          fontSize: 23.0),

                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Text(
                        "Digite seu e-mail, enviaremos um e-mail de recuperação",
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
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        controller: _emailController,

                        decoration: InputDecoration(

                            hintText: "Email",
                            hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0
                            )
                        ),
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
                            "Enviar",
                            style: TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          onPressed: (){
                            /*Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) => TelaLogin(),
                        ));*/if(_emailController.text.isEmpty)
                              _scaffoldKey.currentState.showSnackBar(
                                  SnackBar(content: Text("Falha ao criar sua conta!"),
                                    backgroundColor: Colors.red,
                                    duration: Duration(seconds: 2),
                                  ));
                            else {
                              model.Recuperar(_emailController.text);
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context)=>RegistroFinal())
                              );

                            };
                          },
                          color: Colors.blue[800],

                        ),
                      ),
                    ),
                  ),




                ],
              ),
            );
          },
        ),

      ),
    );
  }
}
