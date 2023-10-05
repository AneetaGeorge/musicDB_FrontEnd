import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:music_db/models/artist.dart';
import 'package:music_db/models/recording.dart';
import 'package:music_db/models/release_group.dart';

class ArtistRepository {
  static Future<Artist> getArtistDetails(String keyword) async {
    Uri url = Uri.parse('http://10.0.2.2:8001/api/artist/$keyword');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final dynamic decodedList = jsonDecode(response.body);
        final Artist artist = Artist.fromJson(decodedList);
        return artist;
      }
      else if (response.statusCode == 404) {
        throw 'Sorry, we could not find data for $keyword';
      }
      else {
        throw 'Request failed with status code ${response.statusCode}';
      }

    } catch (e) {
      rethrow;
    }
  }

  static Future<List<ReleaseGroup>> getArtistAlbums(String keyword) async {
    Uri url = Uri.parse('http://10.0.2.2:8001/api/artist/$keyword/albums');
    print('Fetching artist album data');
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> decodedList = jsonDecode(response.body) as List;
        final List<ReleaseGroup> recordingGroups = decodedList.map((e) {
            return ReleaseGroup.fromJson(e);
          }
        ).toList();

        return recordingGroups;
      }
      else if (response.statusCode == 404) {
        throw 'Sorry, we could not find data for $keyword';
      }
      else {
        throw 'Request failed with status code ${response.statusCode}';
      }

    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Recording>> getAlbumTracks(ReleaseGroup album) async {
    Uri url = Uri.parse('http://10.0.2.2:8001/api/album/${album.title}/songs');
   try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> decodedJson = jsonDecode(response.body) as List;
        List<Recording> recordings = decodedJson.map((e) {
          return Recording.fromJson(e);
        }).toList();
        return recordings;
      }
      else if (response.statusCode == 404) {
        throw 'Sorry, we could not find data for ${album.title}';
      }
      else {
        throw 'Request failed with status code ${response.statusCode}';
      }
    }
    catch (e) {
     rethrow;
   }
  }
}