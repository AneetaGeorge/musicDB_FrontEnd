import 'package:music_db/models/release.dart';
import 'package:json_annotation/json_annotation.dart';
part 'recording.g.dart';

@JsonSerializable(explicitToJson: true)
class Recording {
  String id;
  String title;
  int length;
  @JsonKey(name: 'first-release-date')
  String firstReleaseDate;
  List<Release> releases;
  //TODO add Artist Credit attribute

  Recording({required this.id, required this.title, required this.length, required this.firstReleaseDate, required this.releases});

  factory Recording.fromJson(Map<String, dynamic> json) => _$RecordingFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$RecordingToJson(this);
}