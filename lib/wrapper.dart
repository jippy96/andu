import 'package:andu/ecrans/authentification/connexion.dart';
import 'package:andu/ecrans/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    // test si un user est connecté
    final user = Provider.of<User>(context);

    if (user == null) {
      return Connexion(); 
    } else {
      return Home();
    }
  }
}