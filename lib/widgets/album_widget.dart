import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music_db/models/cover_art.dart';
import 'package:music_db/models/release_group.dart';
import 'package:music_db/repository/cover_art_repo.dart';
import 'package:music_db/widgets/progress_widget.dart';

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
                FutureBuilder<List<CoverArt>>(
                    future: coverFuture,
                    builder: (BuildContext context, AsyncSnapshot<List<CoverArt>> snapshot) {
                      if (snapshot.hasData) {
                        return CachedNetworkImage(
                          imageUrl: snapshot.data![0].image,
                          // placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                          height: 150,
                          width: 150,
                        );

                      // return Image.network(
                        //   snapshot.data![0].image,
                        //   height: 150,
                        //   width: 150,
                        // );
                      }
                      else if (snapshot.hasError) {
                        return CachedNetworkImage(
                          imageUrl: 'https://static.vecteezy.com/system/resources/previews/005/337/799/original/icon-image-not-found-free-vector.jpg',
                          // placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                          height: 150,
                          width: 150,
                        );
                      }
                      else {
                        return const ProgressWidget();
                      }
                    }
                ),
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
