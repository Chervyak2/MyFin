
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:myfin/consts/conctc.dart';
import 'package:myfin/consts/firebase_consts.dart';

class AuthController extends GetxController{

  //login method
  Future<UserCredential?> loginMethod({email,password,context}) async{
    UserCredential? userCredential;

    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //signup method
  Future<UserCredential?> signupMethod({email,password,context}) async{
    UserCredential? userCredential;

    try {
      userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //storing data method
  storeUserData({name, password, email}) async{
    DocumentReference store = await firestore.collection(usersCollection).doc(currentUser!.uid);
    store.set({
      'name' : name,
      'password' : password,
      'email' : email,
      'imageUrl': ''

    });
  }

  //signout method
  signoutMethod(context) async{
    try {
      await auth.signOut();
      
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

}