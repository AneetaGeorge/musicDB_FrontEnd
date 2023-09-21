import 'package:music_db/entities/release_group.dart';

class Release {
  String id;
  String title;
  String status;
  String date;
  String country;
  int trackCount;
  ReleaseGroup releaseGroup;

  //TODO: Add Artist credit attribute

  Release({required this.id, required this.title, required this.status, required this.date, required this.country, required this.trackCount, required this.releaseGroup});

  //TODO: Add .fromJSON constructor
}