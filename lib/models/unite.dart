import 'package:andu/models/ressources.dart';
import 'package:flutter/material.dart';

class UniteEnseignement {
  final String nom;
  final Icon icon;
  final Color color;
  final List<Video> videos;
  final List<Document> documents;

  UniteEnseignement({
    this.icon,
    this.nom,
    this.color,
    this.videos,
    this.documents
  });
}