import 'package:flutter/material.dart';
import 'package:music_db/models/artist.dart';
import 'package:music_db/models/release_group.dart';
import 'package:music_db/repository/artist_repo.dart';
import 'package:music_db/widgets/album_widget.dart';
import 'package:music_db/widgets/artist_widget.dart';
import 'package:music_db/widgets/progress_widget.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    String keyword = ModalRoute.of(context)!.settings.arguments as String;
    ArtistRepository artistRepo = ArtistRepository();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child : Column(
            children: [
              FutureBuilder<Artist>(
                  future: artistRepo.getArtistDetails(keyword),
                  builder: (BuildContext context, AsyncSnapshot<Artist> snapshot) {
                    if (snapshot.hasData) {
                      return ArtistWidget(artist: snapshot.data!);
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    else {
                      return const ProgressWidget();
                    }
                  }
              ),
              FutureBuilder<List<ReleaseGroup>>(
                            future: artistRepo.getArtistAlbums(keyword),
                            builder: (BuildContext context, AsyncSnapshot<List<ReleaseGroup>> snapshot) {
                              if (snapshot.hasData) {
                                return Expanded(
                                  child: ListView.builder(
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        return AlbumWidget(album: snapshot.data![index]);
                                      }
                                  ),
                                );
                              }
                              else if (snapshot.hasError) {
                                return Text('${snapshot.error}');
                              }
                              else {
                                return const ProgressWidget();
                              }
                            }
              )
            ],
          ),
        )
      )
    );
  }
}
