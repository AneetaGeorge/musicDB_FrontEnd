import 'package:flutter/material.dart';
// import 'package:music_db/models/artist.dart';
import 'package:music_db/models/release_group.dart';
import 'package:music_db/repository/artist_repo.dart';
import 'package:music_db/widgets/album_widget.dart';
// import 'package:music_db/widgets/artist_widget.dart';
import 'package:music_db/widgets/progress_widget.dart';

class SearchResult extends StatefulWidget {
  final String keyword;
  const SearchResult({super.key, required this.keyword});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  late final Future<List<ReleaseGroup>> _artistRepoFuture;

  @override
  void initState() {
    super.initState();
    _artistRepoFuture = ArtistRepository.getArtistAlbums(widget.keyword);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.keyword),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // FutureBuilder<Artist>(
            //     future: ArtistRepository.getArtistDetails(widget.keyword),
            //     builder: (BuildContext context, AsyncSnapshot<Artist> snapshot) {
            //       if (snapshot.hasData) {
            //         return ArtistWidget(artist: snapshot.data!);
            //       } else if (snapshot.hasError) {
            //         return Text('${snapshot.error}');
            //       }
            //       else {
            //         return const ProgressWidget();
            //       }
            //     }
            // ),
            FutureBuilder(
                          future: _artistRepoFuture,
                          builder: (BuildContext context, AsyncSnapshot snapshot) {
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
        )
    );
  }
}
