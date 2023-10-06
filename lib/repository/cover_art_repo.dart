import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:music_db/models/cover_art.dart';

class CoverArtRepo {
  static Future<List<CoverArt>> _getCoverArt(Uri uri, String mbId) async {
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
  static Future<List<CoverArt>> getReleaseGroupCovertArt(String mbId) {
    Uri uri = Uri.parse('http://coverartarchive.org/release-group/$mbId');
    return _getCoverArt(uri, mbId);
  }

  static Future<List<CoverArt>> getReleaseCoverArt(String mbId) {
    Uri uri = Uri.parse('http://coverartarchive.org/release/$mbId');
    return _getCoverArt(uri, mbId);
    }
  }