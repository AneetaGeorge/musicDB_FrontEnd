import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:music_db/models/cover_art.dart';

class CoverArtRepo {
  Future<List<CoverArt>> getReleaseGroupCovertArt(String mbId) async {
    Uri uri = Uri.parse('http://coverartarchive.org/release-group/$mbId');
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        dynamic decodedList = jsonDecode(response.body);
        List<dynamic> images = decodedList['images'] as List;
        List<CoverArt> coverArts = images.map((e) {
          return CoverArt.fromJson(e);
        }).toList();
        return coverArts;

      } else if (response.statusCode == 404) {
        throw 'Sorry, we could not find cover art for $mbId';
      }
      else {
        throw 'Request failed with status code ${response.statusCode}';
      }
    } catch (e) {
      rethrow;
    }
  }
}