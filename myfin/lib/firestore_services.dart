import 'package:myfin/consts/conctc.dart';

class FirestoreServices {
  static getUser(uid){
    return firestore.collection(usersCollection).where('id')
  }
  
}