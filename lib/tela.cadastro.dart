

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platinumbetss/modelos/user_model.dart';
import 'package:platinumbetss/registro.final.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:core';

class TelaCadastro extends StatefulWidget {
  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final _formKey = GlobalKey<FormState>();

  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _cpfController = TextEditingController();
  final _sobrenomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModelDescendant<UserModel>(
        builder: (context,child, model){
          if(model.Isloading)
            return Center(child: CircularProgressIndicator(),);
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
                      child: Form(

                        child:  TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(

                              hintText: "    Email",
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0
                              )
                          ),
                          validator: (text){
                            if(text.isEmpty)
                              return "Email Inválido" ;
                          },
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
                      child: Form(

                        child:  TextFormField(
                          controller: _senhaController,
                          keyboardType: TextInputType.text,
                          validator: (text){
                            if(text.isEmpty) return "Senha Inválida" ;
                          },
                          obscureText: true,
                          decoration: InputDecoration(

                              hintText: "    Senha",
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0
                              )
                          ),
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
                      child: Form(

                        child:  TextFormField(
                          controller: _cpfController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(

                              hintText: "    CPF",
                             hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0
                              ),
                          ),
                          validator: (text){
                            if(text.isEmpty) return "CPF Inválido" ;
                          },
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
                      child: Form(

                        child: TextFormField(
                          controller: _nomeController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(

                              hintText: "    Nome",
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0
                              )
                          ),

                          validator: (text){
                            if(text.isEmpty) return "Nome inválido";
                          },
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
                      child:Form(

                        child:  TextFormField(
                          controller: _sobrenomeController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(

                              hintText: "    Sobrenome",
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0
                              )
                          ),
                          validator: (text){
                            if(text.isEmpty) return "Sobrenome Inválido" ;
                          },
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
                              /*Navigator.push(context,
                                MaterialPageRoute(
                                  builder: (context) => RegistroFinal(),
                                ));*/
                              if(_formKey.currentState.validate()) {

                                Map<String,dynamic> userData = {
                                  "nome" : _nomeController.text,
                                  "email" : _emailController.text,
                                  "sobrenome" : _sobrenomeController.text,
                                  "cpf" : _cpfController.text,



                                };
                                model.Cadastrar(
                                  userData: userData,
                                  pass: _senhaController.text,
                                  onFail: _onFail,
                                  onSuccess: _onSuccess,
                                );
                              }
                            },
                            color: Colors.blue[800],

                          ),
                        ),
                      ),
                    ),




                  ],
                ),
              ),

            ),);
        },
      ),
    );


  }
  void _onSuccess(){


  }

  void _onFail(){


  }
}
