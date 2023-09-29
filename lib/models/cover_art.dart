import 'package:json_annotation/json_annotation.dart';
part 'cover_art.g.dart';

@JsonSerializable(explicitToJson: true)
class CoverArt {
  String? id;
  bool approved;
  bool back;
  bool front;
  String image;
  //TODO: Add thumbnails attribute

  CoverArt({this.id, required this.approved, required this.back, required this.front, required this.image});

  factory CoverArt.fromJson(Map<String, dynamic> json) => _$CoverArtFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CoverArtToJson(this);
}