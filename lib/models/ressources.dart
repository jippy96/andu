
class Video {
  final String titre;
  final double taille;

  Video({
    this.titre,
    this.taille
  });
}

class Document {
  final String nom;

  Document({
    this.nom
  });
}

final List<Document> documents = [
  Document(nom: 'La factorisation'),
  Document(nom: 'La factorisation'),
];
final List<Video> videos = [
  Video(titre: 'La factorisation', taille: 2.4),
  Video(titre: 'La factorisation', taille: 2.4),
];