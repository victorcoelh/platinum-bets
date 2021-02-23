import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platinumbetss/tela.login.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:platinumbetss/info.dart';



class UserModel extends Model{

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser firebaseUser;
  Map<String, dynamic> userData = Map();

  bool Isloading = false;


  void Entrar({@required String email,@required String pass,@required VoidCallback onSuccess,@required VoidCallback onFail}) async{
    Isloading = true;
    notifyListeners();

    _auth.signInWithEmailAndPassword(email: email, password: pass).then(
         (user)async{
           firebaseUser = user;

           await _loadCurrentUser();
           onSuccess();
           Isloading = false;
           notifyListeners();

    }).catchError((a){
      onFail();
      Isloading = false;
      notifyListeners();
    });


  }

  void Cadastrar({ @required Map<String, dynamic> userData, @required String pass,  @required VoidCallback onSuccess, @required VoidCallback onFail} ){

    Isloading = true;
    notifyListeners();


    _auth.createUserWithEmailAndPassword(
        email: userData["email"],
        password: pass).then((user) async{
          firebaseUser = user;


         await _saveUserData(userData);

          onSuccess();
          Isloading = false;
          notifyListeners();


    }).catchError((e){
      onFail();
      Isloading = false;
      notifyListeners();

    });

  }


  void Recuperar(String email){
    _auth.sendPasswordResetEmail(
        email: email);

  }

  void Sair()async{
    Isloading = true;
   await _auth.signOut();

   userData = Map();
   firebaseUser = null;
   Isloading = false;

  }

  bool EstaLogado(){
    return firebaseUser != null;
  }

  void DataUpdate() async{
    DocumentSnapshot docUser = await Firestore.instance.collection("users").document(firebaseUser.uid).get();
    userData = docUser.data;
  }

  Future<Null> _saveUserData(Map<String,dynamic> userData) async{
    this.userData = userData;
     await Firestore.instance.collection("users").document(firebaseUser.uid).setData(userData);
  }

  Future<Null> _loadCurrentUser() async{
    if(firebaseUser == null)
      firebaseUser = await _auth.currentUser();
    if(firebaseUser != null){
        DocumentSnapshot docUser =
        await Firestore.instance.collection("users").document(firebaseUser.uid).get();
      userData = docUser.data;
  }
  }
    notifyListeners();


}