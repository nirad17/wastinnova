import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wastinnova/models/user.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final _firestore= FirebaseFirestore.instance;
  
  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap=await _firestore.collection('users').doc(currentUser.uid).get();
    return model.User.fromSnap(snap);
  }
  //sign up user
  Future<String> signUpUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        //register
        UserCredential cred= await _auth.createUserWithEmailAndPassword(email: email, password: password);
        print(cred.user?.uid);

        //add user to the DB
        model.User user= model.User(
          uid : cred.user!.uid,//we men are the best
          email : email,
          // other fields

        );
        await _firestore.collection('users').doc(cred.user!.uid).set(user.toJson());

        // without uid

        res="Success";
      }
    } on FirebaseAuthException catch(err) {
      res=err.message!;
    }
    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password
  }) async {
    String res="Some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        _auth.signInWithEmailAndPassword(email: email, password: password);
        res="Success";
      }
      else {
        res="Please enter all the fields";
      }
    } on FirebaseAuthException catch(err) {
      res=err.message!;
    }
    return res;

  }



  Future<void> signOut() async{
    await _auth.signOut();
  }
}