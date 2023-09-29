// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cover_art.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoverArt _$CoverArtFromJson(Map<String, dynamic> json) => CoverArt(
      // id: json['id'] as String,
      approved: json['approved'] as bool,
      back: json['back'] as bool,
      front: json['front'] as bool,
      image: json['image'] as String,
    );

Map<String, dynamic> _$CoverArtToJson(CoverArt instance) => <String, dynamic>{
      // 'id': instance.id,
      'approved': instance.approved,
      'back': instance.back,
      'front': instance.front,
      'image': instance.image,
    };
