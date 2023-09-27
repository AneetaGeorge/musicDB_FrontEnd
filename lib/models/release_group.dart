import 'package:json_annotation/json_annotation.dart';
part 'release_group.g.dart';

@JsonSerializable(explicitToJson: true)
class ReleaseGroup {
  String id;
  String title;
  @JsonKey(name: 'primary-type')
  String primaryType;
  @JsonKey(name: 'secondary-type')
  String? secondaryType;
  @JsonKey(name: 'first-release-date')
  String firstReleaseDate;
  //TODO: Add Artist credit attribute

  ReleaseGroup({required this.id, required this.title, required this.primaryType, required this.secondaryType, required this.firstReleaseDate});

  factory ReleaseGroup.fromJson(Map<String, dynamic> json) => _$ReleaseGroupFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ReleaseGroupToJson(this);

}