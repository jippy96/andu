import 'package:andu/models/user.dart';
import 'package:andu/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // authentification change user stream
  Stream<User> get user {
    return _firebaseAuth.onAuthStateChanged
        .map((FirebaseUser user) => _UserFromFirebaseUser(user));
  }

// Conversion firebaseUser en User du modele
  User _UserFromFirebaseUser(FirebaseUser firebaseUser) {
    return firebaseUser != null ? User(uid: firebaseUser.uid) : null;
  }

  // méthode d'inscription de l'user
  Future inscriptionUser(String email, String password, String prenoms) async {
    try {
      AuthResult _result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser firebaseUser = _result.user;

      // inscription data
      await DatabaseService(uid: firebaseUser.uid).updateUserDataOrCreate(prenoms, email);
      return _UserFromFirebaseUser(firebaseUser);
      
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // méthode de connexion user
  Future signInWithEmailAndPasswor(String email, String password) async {
    try {
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      return _UserFromFirebaseUser(user);

    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // méthode de déconnexionn User
  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
