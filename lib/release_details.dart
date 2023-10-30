import 'package:flutter/material.dart';
import 'package:music_db/models/release.dart';
import 'package:music_db/repository/artist_repo.dart';
import 'package:music_db/repository/cover_art_repo.dart';
import 'package:music_db/widgets/progress_widget.dart';
import 'package:music_db/widgets/track_widget.dart';

class ReleaseDetails extends StatefulWidget {
  final Release release;
  const ReleaseDetails({super.key, required this.release});

  @override
  State<ReleaseDetails> createState() => _ReleaseDetailsState();
}

class _ReleaseDetailsState extends State<ReleaseDetails> {
  late final Future albumDetFuture, coverImgFuture;

  @override
  initState() {
    super.initState();
    albumDetFuture = ArtistRepository.getReleaseTracks(widget.release);
    coverImgFuture = CoverArtRepo.getReleaseCoverArt(widget.release.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
        appBar: AppBar(
          // leading: Card(
          flexibleSpace: FutureBuilder(
            future: coverImgFuture,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Image.network(snapshot.data![0].image,
                        fit: BoxFit.fitWidth);
              }
              else {
                return Container(
                  height: 200,
                );
              }
            },

          ),
          // ),
        ),
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
                            return TrackWidget(track: snapshot.data![index], release: widget.release);
                          }
                      ),
                    ),
                  ],
                );
              }
              else if (snapshot.hasError) {
                return Center(child: Text('$snapshot.error'));
              }
              else {
                return const ProgressWidget();
                }
              }
          ),
        )
    );
  }
}
