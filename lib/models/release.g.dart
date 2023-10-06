// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'release.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Release _$ReleaseFromJson(Map<String, dynamic> json) => Release(
      id: json['id'] as String,
      title: json['title'] as String,
      status: json['status'] as String?,
      date: json['date'] as String?,
      country: json['country'] as String?,
      trackCount: json['track-count'] as int?,
    );

Map<String, dynamic> _$ReleaseToJson(Release instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'status': instance.status,
      'date': instance.date,
      'country': instance.country,
      'track-count': instance.trackCount,
    };
