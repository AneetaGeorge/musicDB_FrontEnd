import 'package:music_db/entities/release.dart';

class Recording {
  String id;
  String title;
  int length;
  String firstReleaseDate;
  List<Release> releases;
  //TODO add Artist Credit attribute

  Recording({required this.id, required this.title, required this.length, required this.firstReleaseDate, required this.releases});
}