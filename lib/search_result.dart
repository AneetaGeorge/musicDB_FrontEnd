import 'package:flutter/material.dart';
import 'package:music_db/entities/artist.dart';
import 'package:music_db/repository/artist_repo.dart';

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
          child : FutureBuilder<Artist>(
              future: artistRepo.getArtistDetails(keyword),
              builder: (BuildContext context, AsyncSnapshot<Artist> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Text(snapshot.data!.name),
                      Text(snapshot.data!.sortName),
                      Text(snapshot.data!.type!),
                      Text(snapshot.data!.country!)
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                else {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                        child: CircularProgressIndicator()
                    ),
                  );
                }
              }
          ),
        )
      )
    );
  }
}
