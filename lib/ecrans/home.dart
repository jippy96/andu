import 'package:andu/composants/constantes.dart';
import 'package:andu/models/ressources.dart';
import 'package:andu/models/unite.dart';
import 'package:andu/models/user.dart';
import 'package:andu/services/firebase.dart';
import 'package:andu/widget/ueWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

class _HomeState extends State<Home> {
  FirebaseService firebaseService = FirebaseService();

  List<UniteEnseignement> ue = [
    UniteEnseignement(
        icon: Icon(
          FontAwesomeIcons.globeAfrica,
          color: Colors.white,
          size: 72,
        ),
        nom: 'HISTO-GEO',
        color: '#18D09D'.toColor(),
        documents: documents,
        videos: videos),
    UniteEnseignement(
        icon: Icon(
          FontAwesomeIcons.flask,
          color: Colors.white,
          size: 72,
        ),
        nom: 'PC',
        color: '##EE9F70'.toColor(),
        documents: documents,
        videos: videos),
    UniteEnseignement(
        icon: Icon(
          FontAwesomeIcons.calendarAlt,
          color: Colors.white,
          size: 72,
        ),
        nom: 'MATHS',
        color: '#83E2EC'.toColor(),
        documents: documents,
        videos: videos),
    UniteEnseignement(
        icon: Icon(
          FontAwesomeIcons.microscope,
          color: Colors.white,
          size: 72,
        ),
        nom: 'SVT',
        color: '##F3DD3E'.toColor(),
        documents: documents,
        videos: videos),
    UniteEnseignement(
        icon: Icon(
          Icons.work,
          color: Colors.white,
          size: 72,
        ),
        nom: 'SVT',
        color: Colors.blue[300],
        documents: documents,
        videos: videos),
    UniteEnseignement(
      icon: Icon(
        Icons.work,
        color: Colors.white,
        size: 72,
      ),
      nom: 'SVT',
      color: Colors.green,
      documents: documents,
      videos: videos,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    // test si un user est connecté
    final user = Provider.of<User>(context);
    return Scaffold(
      drawerScrimColor: Colors.grey[200],
      drawer: Drawer(
          child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: '#18D09D'.toColor()),
            accountName: Text("Jean-Paul KOUNDOUNO"),
            accountEmail: Text("koundounojp39@gmail.com"),
            currentAccountPicture: CircleAvatar(),
          ),
        ],
      )),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[100],
        iconTheme: new IconThemeData(color: '#18D09D'.toColor()),
        title: Image.asset("assets/images/logo.jpeg"),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.all(0.0),
              child: FlatButton.icon(
                onPressed: () async {
                  await firebaseService.signOut();
                },
                icon: Icon(
                  FontAwesomeIcons.userTie,
                  color: Colors.grey,
                  size: 26,
                ),
                label: Text(''),
              )),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 50),
            child: Text(
              'Unités d\'enseignements',
              style: TextStyle(
                  fontSize: 20,
                  color: '#18D09D'.toColor(),
                  fontWeight: FontWeight.w700),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10),
              itemCount: ue.length,
              itemBuilder: (BuildContext context, int index) {
                UniteEnseignement uniteEnseignement = ue[index];
                return UeWidget(
                  nom: uniteEnseignement.nom,
                  icon: uniteEnseignement.icon,
                  color: uniteEnseignement.color,
                  index: index,
                  documents: uniteEnseignement.documents,
                  videos: uniteEnseignement.videos,
                );
              },
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: '#18D09D'.toColor(),
          elevation: 10,
          items: [
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.paperclip),
              title: Text('Semestre1'),
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.paperPlane),
              title: Text('Semestre1'),
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.folder),
              title: Text('Support'),
            ),
          ]),
    );
  }
}
