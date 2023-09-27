// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recording.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recording _$RecordingFromJson(Map<String, dynamic> json) => Recording(
      id: json['id'] as String,
      title: json['title'] as String,
      length: json['length'] as int,
      firstReleaseDate: json['first-release-date'] as String,
      releases: (json['releases'] as List<dynamic>)
          .map((e) => Release.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecordingToJson(Recording instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'length': instance.length,
      'first-release-date': instance.firstReleaseDate,
      'releases': instance.releases.map((e) => e.toJson()).toList(),
    };
