import 'package:flutter/material.dart';
import 'package:music_db/models/release_group.dart';
import 'package:music_db/repository/artist_repo.dart';
import 'package:music_db/widgets/progress_widget.dart';
import 'package:music_db/widgets/track_widget.dart';

class AlbumDetails extends StatefulWidget {
  final ReleaseGroup album;
  const AlbumDetails({super.key, required this.album});

  @override
  State<AlbumDetails> createState() => _AlbumDetailsState();
}

class _AlbumDetailsState extends State<AlbumDetails> {
  late final Future albumDetFuture;

  @override
  initState() {
    super.initState();
    albumDetFuture = ArtistRepository.getAlbumTracks(widget.album);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: const EdgeInsets.all(5),
          child: FutureBuilder(
            future: albumDetFuture,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return TrackWidget(track: snapshot.data![index]);
                          }
                      ),
                    ),
                  ],
                );
              }
              else if (snapshot.hasError) {
                return Center(child: Text('$snapshot.error'));
              }
              else
                return const ProgressWidget();
            },
          ),
        )
        // Center(child: Text('Displaying details for ${album.title}'))
    );
  }
}
