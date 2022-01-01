import 'package:chat_app/model/Userinfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class Services {
  final FirebaseFirestore _store =FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserData _userFromFirebase(User user,) {
    return user != null
        ? UserData(
            userid: user.uid,
            usermail: user.email,
          )
        : null;
  }

   Stream <UserData> get user{
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  //sign in with mail and password
  Future signINWithMailAndPass(String mail, String pass) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(email: mail.trim(), password: pass.trim());
      User user = userCredential.user;
      return _userFromFirebase(user);
    } catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print(e.message.toLowerCase());
      }
    }
  }
//signUp With Facebook
   Future<void> signUpWithFacebook() async{
    try {
      var facebookLogin = new FacebookLogin();
      var result = await facebookLogin.logIn(['email']);

      if(result.status == FacebookLoginStatus.loggedIn) {
        final AuthCredential credential = FacebookAuthProvider.credential(result.accessToken.token,);
        final User user = (await FirebaseAuth.instance.signInWithCredential(credential)).user;
        await _store.collection("Users").doc(user.uid).set({
        "Username": user.displayName,
        "email": user.email,
         "UserID":user.uid
    });
      print('signed in ' + user.displayName);
      return _userFromFirebase(user);
      }
    }catch (e) {
      print(e.message);
    }
  }

  //regstring with mail and password
  Future regWithMailAndPass(String mail, String pass,String username) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: mail.trim(), password: pass.trim());
     User user = userCredential.user;
     await _store.collection("Users").doc(user.uid).set({
       "Username": username,
       "email": mail,
       "UserID":user.uid
    });
    
      return _userFromFirebase(user);
    } catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      print(e);
    }
  }

  //sign out
  Future signOut() async {
    try {
      return _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
