import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:music_db/models/artist.dart';
import 'package:music_db/models/release_group.dart';

class ArtistRepository {
  Future<Artist> getArtistDetails(String keyword) async {
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

  Future<List<ReleaseGroup>> getArtistAlbums(String keyword) async {
    Uri url = Uri.parse('http://10.0.2.2:8001/api/artist/$keyword/albums');
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
}