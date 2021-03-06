import 'package:andu/composants/constantes.dart';
import 'package:andu/ecrans/authentification/connexion.dart';
import 'package:andu/services/firebase.dart';
import 'package:flutter/material.dart';

class Inscription extends StatefulWidget {
  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  String prenoms, email, password, password2;
  FirebaseService firebaseService = FirebaseService();

  bool isLoading = false;

  var _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return (isLoading)
        ? Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            body: Form(
              key: _key,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Padding(
                            padding: const EdgeInsets.only(top: 80),
                            child: Image.asset('assets/images/logo.jpeg')),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Inscrivez-vous",
                        style: TextStyle(
                            color: '#18D09D'.toColor(),
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        onChanged: (val) => prenoms = val,
                        validator: (val) =>
                            val.isEmpty ? 'Veuilez saisir votre prénoms' : null,
                        keyboardType: TextInputType.text,
                        decoration: textfield.copyWith(hintText: 'Prénoms'),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        onChanged: (val) => email = val,
                        validator: (val) =>
                            val.isEmpty ? 'Veuilez saisir votre E-mail' : null,
                        keyboardType: TextInputType.emailAddress,
                        decoration:
                            textfield.copyWith(hintText: 'Adresse mail'),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        onChanged: (val) => password = val,
                        validator: (val) {
                          if (val.isEmpty || val.length <= 4) {
                            return 'Veuillez saisir un mot de passe supérieur à 6 caractères';
                          } else {
                            return null;
                          }
                        },
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        decoration: textfield.copyWith(
                            hintText: 'Mot de passe (Min 6 caractères)'),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        onChanged: (val) => password2 = val,
                        validator: (val) {
                          if (val.isEmpty || val.length <= 4) {
                            return 'Veuillez saisir un mot de passe supérieur à 6 caractères';
                          } else {
                            return null;
                          }
                        },
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        decoration: textfield.copyWith(
                            hintText: 'Confirmer votre mot de passe'),
                      ),

                      SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (_key.currentState.validate()) {
                            _key.currentState.save();
                            setState(() {
                              isLoading = true;
                            });
                            if (password == password2) {
                              print('mot de passe identique');
                              dynamic resultat = await firebaseService
                                  .inscriptionUser(email, password, prenoms);

                              if (resultat != null) {
                                setState(() {
                                  isLoading = false;
                                });
                               Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) {
                                return Connexion();
                                  }));
                              }
                            } else {
                              setState(() {
                                isLoading = false;
                              });
                              print("password probleme");
                            }

                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: '#18D09D'.toColor()),
                          child: Center(
                              child: Text(
                            'S\'inscrire',
                            style: connexionButton,
                          )),
                        ),
                      ),
                      // Spacer(),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Déjà inscrit ?"),
                          GestureDetector(
                            onTap: () {
                              // remplacement de l'ecran par la page d'inscription
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) {
                                return Connexion();
                              }));
                            },
                            child: Text(
                              "\t Se connecter",
                              style: TextStyle(
                                fontSize: 16,
                                color: '#18D09D'.toColor(),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
