import 'package:json_annotation/json_annotation.dart';
import 'package:music_db/models/release.dart';
part 'release_group.g.dart';

@JsonSerializable(explicitToJson: true)
class ReleaseGroup {
  String id;
  String title;
  @JsonKey(name: 'primary-type')
  String? primaryType;
  @JsonKey(name: 'secondary-type')
  String? secondaryType;
  @JsonKey(name: 'first-release-date')
  String? firstReleaseDate;
  //TODO: Add Artist credit attribute
  List<Release>? releases;

  ReleaseGroup({required this.id, required this.title, this.primaryType, this.secondaryType, this.firstReleaseDate, this.releases});

  factory ReleaseGroup.fromJson(Map<String, dynamic> json) => _$ReleaseGroupFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ReleaseGroupToJson(this);

}