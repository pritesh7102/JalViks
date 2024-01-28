import "package:firebase_auth/firebase_auth.dart";
// import "package:flutter/material.dart";
import "package:jalviks/models/users.dart";
import "package:jalviks/services/database.dart";

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // creating a class for extracting just the user id from the firebaseuser(User)
  ClassUser? _userFromFirebaseUser(User? user) {
    // ignore: unnecessary_null_comparison
    return user != null ? ClassUser(uid: user.uid) : null;
  }

  // auth change using stream
  Stream<ClassUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //sign in anounymously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user!;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email
  Future sighInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register with email
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user!;

      await DatabaseService(uid: user.uid)
          .updateUserData('new_member', '9999999999', 'place');
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign Out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
