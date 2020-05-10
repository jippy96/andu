import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  
  final String uid;

  DatabaseService({
    this.uid
  });

  // connexion à la collection
  final CollectionReference collectionReference = Firestore.instance.collection('users');

  // insertion ou modification data user
  Future updateUserDataOrCreate(String prenoms) async {
    return await collectionReference.document(uid).setData({
      'prenom':prenoms,      
    });
  }
}