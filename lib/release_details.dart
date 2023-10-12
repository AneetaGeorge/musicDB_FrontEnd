import 'package:flutter/material.dart';
import 'package:music_db/models/release.dart';
import 'package:music_db/repository/artist_repo.dart';
import 'package:music_db/widgets/progress_widget.dart';
import 'package:music_db/widgets/track_widget.dart';

class ReleaseDetails extends StatefulWidget {
  final Release release;
  const ReleaseDetails({super.key, required this.release});

  @override
  State<ReleaseDetails> createState() => _ReleaseDetailsState();
}

class _ReleaseDetailsState extends State<ReleaseDetails> {
  late final Future albumDetFuture;

  @override
  initState() {
    super.initState();
    albumDetFuture = ArtistRepository.getReleaseTracks(widget.release);
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
    );
  }
}
