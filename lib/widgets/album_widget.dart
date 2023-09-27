import 'package:flutter/material.dart';
import 'package:music_db/models/release_group.dart';

class AlbumWidget extends StatelessWidget {
  ReleaseGroup album;
  AlbumWidget({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(album.title),
        Text(album.firstReleaseDate),
        Text(album.primaryType)
      ],
    );;
  }
}
