import 'package:json_annotation/json_annotation.dart';
part 'release.g.dart';

@JsonSerializable(explicitToJson: true)
class Release {
  String id;
  String title;
  String? status;
  String? date;
  String? country;
  @JsonKey(name: 'track-count')
  int? trackCount;
  // @JsonKey(name: 'release-group')
  // ReleaseGroup releaseGroup;

  //TODO: Add Artist credit attribute

  Release({required this.id, required this.title, this.status, this.date, this.country, this.trackCount});

  factory Release.fromJson(Map<String, dynamic> json) => _$ReleaseFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ReleaseToJson(this);
}