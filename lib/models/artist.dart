import 'package:json_annotation/json_annotation.dart';
part 'artist.g.dart';

@JsonSerializable(explicitToJson: true)
class Artist {
  String id;
  String name;
  @JsonKey(name: 'sort-name')
  String sortName;
  String? type;
  String? country;
  String? gender;
  String? disambiguation;
  List<Alias>? aliases;

  Artist({required this.id, required this.name, required this.sortName, this.type, this.country, this.gender, this.disambiguation, this.aliases});
  // Artist({required this.id, required this.name, required this.sortName, this.type, this.country, this.gender, this.disambiguation});

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ArtistToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Alias {
  @JsonKey(name: 'sort-name')
  String sortName;
  String? typeId;
  String name;
  String? locale;
  String? type;
  bool? primary;

  Alias({required this.sortName, this.typeId, required this.name, this.locale, this.type, this.primary});

  factory Alias.fromJson(Map<String, dynamic> json) => _$AliasFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AliasToJson(this);
}