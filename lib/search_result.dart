import 'package:flutter/material.dart';
// import 'package:music_db/models/artist.dart';
import 'package:music_db/models/release_group.dart';
import 'package:music_db/repository/artist_repo.dart';
import 'package:music_db/widgets/album_widget.dart';
// import 'package:music_db/widgets/artist_widget.dart';
import 'package:music_db/widgets/progress_widget.dart';
import 'package:collection/collection.dart';

class SearchResult extends StatefulWidget {
  final String keyword;
  const SearchResult({super.key, required this.keyword});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  late final Future<List<ReleaseGroup>> _albumFuture;
  late final Future _artistFuture;

  @override
  void initState() {
    super.initState();
    _albumFuture = ArtistRepository.getArtistAlbums(widget.keyword);
    _artistFuture = ArtistRepository.getArtistDetails(widget.keyword);
  }

  @override
  Widget build(BuildContext context) {

    final sliverAppBar = SliverAppBar(
      stretchTriggerOffset: 300.0,
      expandedHeight: 200.0,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(widget.keyword),
        background: FutureBuilder(
          future: _artistFuture,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Image.network(snapshot.data!.imageUrl,
                  fit: BoxFit.fill);
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
        future: _albumFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          Widget sliverList;
          if (snapshot.hasData) {
            final groupedReleases = groupBy(snapshot.data!, (ReleaseGroup releaseGroup ) => releaseGroup.primaryType);

            sliverList = SliverList(
                delegate: SliverChildBuilderDelegate((BuildContext ctx, int index)
                          {
                            String? category = groupedReleases.keys.elementAt(index);
                            List itemsInCategory = groupedReleases[category]!;

                            return ExpansionTile(
                              title: Text(category!, style: const TextStyle(fontWeight: FontWeight.bold)),
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const ClampingScrollPhysics(),
                                  itemCount: itemsInCategory.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    ReleaseGroup item = itemsInCategory[index];
                                    // Return a widget representing the item
                                    return AlbumWidget(
                                      album: item, );
                                  }, ),
                              ], );
                          },

                  childCount: groupedReleases.length)
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
