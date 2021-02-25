import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platinumbetss/dashboard.dart';
import 'package:platinumbetss/modelos/user_model.dart';
import 'package:platinumbetss/recuperacao.senha.dart';
import 'package:platinumbetss/tela.cadastro.dart';
import 'package:scoped_model/scoped_model.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ScopedModelDescendant<UserModel>(
        builder: (context,child,model){
          if(model.Isloading)
            return Stack(
              children: [
                Image.asset(
                  "assets/imagens/FundoLogin.jpg",
                  fit: BoxFit.cover,
                  height: 1000.0,

                ),
                Center(child: CircularProgressIndicator(),)
              ],
            );

          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Container(
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
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,

                        decoration: InputDecoration(

                            hintText: "Email",
                            hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
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
                        controller: _senhaController,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        obscureText: true,

                        decoration: InputDecoration(

                            hintText: "Senha",
                            hintStyle: TextStyle(
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          " Lembrar usuário",
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14.0
                          ),
                        ),
                        FlatButton(


                          child: Text(
                            "Esqueceu sua senha?",
                            textAlign: TextAlign.right,
                            style: TextStyle(color: Colors.white60,
                                fontSize: 14.0),

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
                                  if(_formKey.currentState.validate()){
                                    model.Entrar(
                                        email: _emailController.text,
                                        pass: _senhaController.text,
                                        onSuccess: _onSuccess,
                                        onFail: _onFail);
                                  }
                                  /*Navigator.push(context,
                                    MaterialPageRoute(
                                      builder: (context) => Dashboard(),
                                    ));*/

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
      )
    );

  }

  void _onSuccess(){
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context)=>Dashboard())
    );

  }
  void _onFail(){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("Falha ao entrar em sua conta!"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ));
  }
}
