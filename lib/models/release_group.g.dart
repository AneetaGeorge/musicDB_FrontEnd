// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'release_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReleaseGroup _$ReleaseGroupFromJson(Map<String, dynamic> json) => ReleaseGroup(
      id: json['id'] as String,
      title: json['title'] as String,
      primaryType: json['primary-type'] as String?,
      secondaryType: json['secondary-type'] as String?,
      firstReleaseDate: json['first-release-date'] as String?,
    );

Map<String, dynamic> _$ReleaseGroupToJson(ReleaseGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'primary-type': instance.primaryType,
      'secondary-type': instance.secondaryType,
      'first-release-date': instance.firstReleaseDate,
    };
