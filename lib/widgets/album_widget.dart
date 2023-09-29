import 'package:flutter/material.dart';
import 'package:music_db/models/cover_art.dart';
import 'package:music_db/models/release_group.dart';
import 'package:music_db/repository/cover_art_repo.dart';
import 'package:music_db/widgets/progress_widget.dart';

class AlbumWidget extends StatelessWidget {
  ReleaseGroup album;
  AlbumWidget({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    // print('Album ID: ${album.id}');
    CoverArtRepo coverArtRepo = CoverArtRepo();

    return Container(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              FutureBuilder<List<CoverArt>>(
                  future: coverArtRepo.getReleaseGroupCovertArt(album.id),
                  builder: (BuildContext context, AsyncSnapshot<List<CoverArt>> snapshot) {
                    if (snapshot.hasData) {
                      return Image.network(
                        snapshot.data![0].image,
                        height: 150,
                        width: 150,
                      );
                    }
                    else if (snapshot.hasError) {
                      return Image.network('https://static.vecteezy.com/system/resources/previews/005/337/799/original/icon-image-not-found-free-vector.jpg', height: 150,);
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
                    Text(album.title,
                        overflow: TextOverflow.clip,),
                    Text('${album.firstReleaseDate}'),
                    Text('${album.primaryType}'),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
