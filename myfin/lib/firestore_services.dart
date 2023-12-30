import 'package:myfin/consts/conctc.dart';
//get user data
class FirestoreServices {
  static getUser(uid){
    return firestore.collection(usersCollection).where('id',isEqualTo: uid).snapshots();
  }
  
}