import 'package:flutter/material.dart';
import 'package:music_db/models/recording.dart';
import 'package:duration/duration.dart';
import 'package:music_db/models/release.dart';
import 'package:music_db/repository/cover_art_repo.dart';
import 'package:music_db/widgets/cover_art_widget.dart';

class TrackWidget extends StatefulWidget {
  final Recording track;
  final Release release;
  const TrackWidget({super.key, required this.track, required this.release});

  @override
  State<TrackWidget> createState() => _TrackWidgetState();
}

class _TrackWidgetState extends State<TrackWidget> {
  late final Future trackImgFuture;
  
  @override
  void initState() {
    super.initState();
    trackImgFuture = CoverArtRepo.getReleaseCoverArt(widget.release.id);
  }
  
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Row(
          children: [
            CoverArtWidget(coverFuture: trackImgFuture, height: 80, width: 80,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.track.title),
                    if(widget.track.length != null) Text(prettyDuration(Duration(milliseconds: widget.track.length!), abbreviated: true, delimiter: ' ', spacer: ''))
                  ],
                ),
              )
          ],
        ),
      );
  }
}
