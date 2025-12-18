// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PhotoCollection _$PhotoCollectionFromJson(Map<String, dynamic> json) =>
    _PhotoCollection(
      commercial:
          (json['commercial'] as List<dynamic>?)
              ?.map((e) => MediaItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      personal:
          (json['personal'] as List<dynamic>?)
              ?.map((e) => MediaItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PhotoCollectionToJson(_PhotoCollection instance) =>
    <String, dynamic>{
      'commercial': instance.commercial,
      'personal': instance.personal,
    };
