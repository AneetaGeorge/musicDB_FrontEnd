import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music_db/models/recording.dart';
import 'package:duration/duration.dart';
import 'package:music_db/repository/cover_art_repo.dart';
import 'package:music_db/widgets/progress_widget.dart';

class TrackWidget extends StatefulWidget {
  final Recording track;
  const TrackWidget({super.key, required this.track});

  @override
  State<TrackWidget> createState() => _TrackWidgetState();
}

class _TrackWidgetState extends State<TrackWidget> {
  late final Future trackImgFuture;
  
  @override
  void initState() {
    super.initState();
    trackImgFuture = CoverArtRepo.getReleaseCoverArt(widget.track.id);
  }
  
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              padding: const EdgeInsets.only(right: 5),
              child: FutureBuilder(
                  future: trackImgFuture,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return CachedNetworkImage(
                        imageUrl: snapshot.data![0].image,
                        // placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                        height: 100,
                        width: 100,
                      );
                    }
                    else if (snapshot.hasError) {
                      return CachedNetworkImage(
                        imageUrl: 'https://static.vecteezy.com/system/resources/previews/005/337/799/original/icon-image-not-found-free-vector.jpg',
                        // placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                        height: 100,
                        width: 100,
                      );
                    }
                    else {
                      return const ProgressWidget();
                    }
                  }
              ),
            ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.track.title),
                  if(widget.track.length != null) Text(prettyDuration(Duration(milliseconds: widget.track.length!), abbreviated: true, delimiter: ' ', spacer: ''))
                ],
              )
          ],
        ),
      );
  }
}
