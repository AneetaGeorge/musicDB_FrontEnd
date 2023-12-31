import 'package:flutter/material.dart';
import 'package:music_db/album_details.dart';
import 'package:music_db/models/release.dart';
import 'package:music_db/models/release_group.dart';
import 'package:music_db/page_not_found.dart';
import 'package:music_db/release_details.dart';
import 'package:music_db/search_widget.dart';
import 'package:music_db/search_result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MusicDB App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SearchWidget(),
      // routes: {
      //   '/search-result': (context) => SearchResult()
      // },
      onGenerateRoute: (settings) {
        if (settings.name == '/album-details') {
          final args = settings.arguments as ReleaseGroup;
          return MaterialPageRoute(
            builder: (context) {
              return AlbumDetails(
                  album: args
              );
            },
          );
        }

        else if (settings.name == '/search-result') {
          final args = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) {
              return SearchResult(
                keyword: args
              );
            },
          );
        }

        else if (settings.name == '/release-details') {
          final args = settings.arguments as Release;
          return MaterialPageRoute(
            builder: (context) {
              return ReleaseDetails(
                  release: args
              );
            },
          );
        }
        else {
          return MaterialPageRoute(
              builder: (context) {
                return const PageNotFound();
              }
          );
        }
      },
    );
  }
}
