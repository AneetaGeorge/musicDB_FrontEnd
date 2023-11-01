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
     final sliverAppBar = SliverAppBar(
      stretchTriggerOffset: 300.0,
      expandedHeight: 200.0,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(widget.release.title),
        background: FutureBuilder(
                future: coverImgFuture,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Image.network(snapshot.data![0].image,
                            fit: BoxFit.fitWidth);
                  }
                  //TODO: Add an alternate image in case image is not present
                  else {
                    return Container(
                      height: 200,
                    );
                  }
                },

              )
      ),
    );

    return Scaffold(
        body: FutureBuilder(
            future: albumDetFuture,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              Widget sliverList;
              if (snapshot.hasData) {
                sliverList = SliverList(
                    delegate: SliverChildBuilderDelegate((BuildContext ctx, int index)
                    {
                      return TrackWidget(track: snapshot.data![index], release: widget.release);
                    },
                        childCount: snapshot.data!.length)
                );
              }
              else if (snapshot.hasError) {
                sliverList = SliverToBoxAdapter(
                    child: Text('${snapshot.error}'));
              }
              else {
                sliverList = const SliverToBoxAdapter(child: ProgressWidget());
              }

              return CustomScrollView(
                slivers: <Widget>[
                  sliverAppBar,
                  sliverList
                ],
              );
            }
        )
    );
  }
}
