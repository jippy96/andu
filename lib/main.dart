import 'package:andu/ecrans/authentification/connexion.dart';
import 'package:andu/models/user.dart';
import 'package:andu/services/firebase.dart';
import 'package:andu/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Andu',
        theme: ThemeData(        
          primarySwatch: Colors.green,
        ),
        home: Wrapper(),
      ), value: FirebaseService().user,
    );
  }
}

