// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MediaItem _$MediaItemFromJson(Map<String, dynamic> json) => _MediaItem(
  id: json['id'] as String,
  title: json['title'] as String,
  type: $enumDecode(_$MediaTypeEnumMap, json['type']),
  subtitle: json['subtitle'] as String?,
  children:
      (json['children'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$MediaItemToJson(_MediaItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': _$MediaTypeEnumMap[instance.type]!,
      'subtitle': instance.subtitle,
      'children': instance.children,
    };

const _$MediaTypeEnumMap = {MediaType.photo: 'photo', MediaType.video: 'video'};
