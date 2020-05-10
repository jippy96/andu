import 'package:andu/models/ressources.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

class DetailsCours extends StatelessWidget {
  final String nom;
  final List<Video> videos;
  final List<Document> documents;

  DetailsCours({
    this.nom,
    this.videos,
    this.documents,
  });
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey[50],
          iconTheme: new IconThemeData(color: '#18D09D'.toColor()),
          title: Text(
            nom,
            style: TextStyle(color: '#18D09D'.toColor()),
          ),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.all(0.0),
                child: FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 26,
                    color: Colors.grey,
                  ),
                  label: Text(''),
                )),
          ],
          bottom: TabBar(tabs: [

            Tab(
              child: Text(
                'Documents',
                style: TextStyle(color: '#18D09D'.toColor()),
              ),
            ),
            Tab(
              child: Text(
                'Vidéo',
                style: TextStyle(color: '#18D09D'.toColor()),
              ),
            ),
            Tab(
              child: Text(
                'Téléchargements',
                maxLines: 1,
                style: TextStyle(color: '#18D09D'.toColor()),
              ),
            ),
          ]),
        ),
        body: TabBarView(children: <Widget>[
          Center(
            child: ListView.builder(
              itemCount: documents.length,
              itemBuilder: (BuildContext context, int index){
                Document document = documents[index];
              return Card(
                child: Container(
                  height: 80,
                  child: ListTile(
                    trailing: FaIcon(FontAwesomeIcons.download),
                    title: Text('${document.nom}', textAlign: TextAlign.center,),
                  )
                ),
              );
            })
          ),
          Center(
            child: Text('data2'),
          ),
          Center(
            child: Text('data3'),
          ),
        ]),
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
          ],
          currentIndex: 2,
        ),
      ),
      length: 3,
    );
  }
}
