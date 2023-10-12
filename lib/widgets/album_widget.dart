import 'package:flutter/material.dart';
import 'package:music_db/models/cover_art.dart';
import 'package:music_db/models/release_group.dart';
import 'package:music_db/repository/cover_art_repo.dart';
import 'package:music_db/widgets/cover_art_widget.dart';

class AlbumWidget extends StatefulWidget {
  final ReleaseGroup album;
  const AlbumWidget({super.key, required this.album});

  @override
  State<AlbumWidget> createState() => _AlbumWidgetState();
}

class _AlbumWidgetState extends State<AlbumWidget> {
  late final Future<List<CoverArt>> coverFuture;

  @override
  initState() {
    super.initState();
    coverFuture = CoverArtRepo.getReleaseGroupCovertArt(widget.album.id);
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/album-details', arguments: widget.album);
            },
            child: Row(
              children: [
                CoverArtWidget(coverFuture: coverFuture),
                Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.album.title,
                          overflow: TextOverflow.clip,),
                      Text('${widget.album.firstReleaseDate}'),
                      Text('${widget.album.primaryType}'),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
