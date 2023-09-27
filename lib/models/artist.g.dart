// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Artist _$ArtistFromJson(Map<String, dynamic> json) => Artist(
      id: json['id'] as String,
      name: json['name'] as String,
      sortName: json['sort-name'] as String,
      type: json['type'] as String?,
      country: json['country'] as String?,
      gender: json['gender'] as String?,
      disambiguation: json['disambiguation'] as String?,
      // aliases: (json['aliases'] as List<dynamic>?)
      //     ?.map((e) => Alias.fromJson(e as Map<String, dynamic>))
      //     .toList(),
    );

Map<String, dynamic> _$ArtistToJson(Artist instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sort-name': instance.sortName,
      'type': instance.type,
      'country': instance.country,
      'gender': instance.gender,
      'disambiguation': instance.disambiguation,
      'aliases': instance.aliases?.map((e) => e.toJson()).toList(),
    };

Alias _$AliasFromJson(Map<String, dynamic> json) => Alias(
      sortName: json['sort-name'] as String,
      typeId: json['typeId'] as String,
      name: json['name'] as String,
      locale: json['locale'] as String?,
      type: json['type'] as String,
      primary: json['primary'] as bool?,
    );

Map<String, dynamic> _$AliasToJson(Alias instance) => <String, dynamic>{
      'sort-name': instance.sortName,
      'typeId': instance.typeId,
      'name': instance.name,
      'locale': instance.locale,
      'type': instance.type,
      'primary': instance.primary,
    };
