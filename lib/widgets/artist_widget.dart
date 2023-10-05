import 'package:flutter/material.dart';
import 'package:music_db/models/artist.dart';

class ArtistWidget extends StatelessWidget {
  Artist artist;
  ArtistWidget({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
        Text(
            artist.name,
            style: const TextStyle(
              fontSize: 30
            ),
        ),
        // Text(artist.sortName),
        // Text(artist.type!),
        // Text(artist.country!)
      ],
    );
  }
}
