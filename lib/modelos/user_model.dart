import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';



class UserModel extends Model{

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser firebaseUser;
  Map<String, dynamic> userData = Map();

  bool Isloading = false;


  void Entrar() async{
    Isloading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 3));
    Isloading = false;
    notifyListeners();

  }

  void Cadastrar({ @required Map<String, dynamic> userData, @required String pass,  @required VoidCallback onSucess, @required VoidCallback onFail} ){

    Isloading = true;
    notifyListeners();
    _auth.createUserWithEmailAndPassword(
        email: userData["email"],
        password: pass).then((user) async{
          firebaseUser = user as FirebaseUser;


         await _saveUserData(userData);

          onSucess();
          Isloading = false;
          notifyListeners();


    }).catchError((e){
      onFail();
      Isloading = false;
      notifyListeners();

    });

  }


  void Recuperar(){

  }


  Future<Null> _saveUserData(Map<String,dynamic> userData) async{
    this.userData = userData;
     await Firestore.instance.collection("users").document(firebaseUser.uid).setData(userData);
  }


}