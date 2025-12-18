// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VideoCollection _$VideoCollectionFromJson(Map<String, dynamic> json) =>
    _VideoCollection(
      videos:
          (json['videos'] as List<dynamic>?)
              ?.map((e) => MediaItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$VideoCollectionToJson(_VideoCollection instance) =>
    <String, dynamic>{'videos': instance.videos};
