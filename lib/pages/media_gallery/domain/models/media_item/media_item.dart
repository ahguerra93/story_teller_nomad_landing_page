import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/models/media_item/media_type.dart';

part 'media_item.freezed.dart';
part 'media_item.g.dart';

@freezed
abstract class MediaItem with _$MediaItem {
  factory MediaItem({
    required String id,
    required String title,
    required MediaType type,
    String? subtitle,
    @Default([]) List<String> children,
  }) = _MediaItem;

  factory MediaItem.fromJson(Map<String, dynamic> json) => _$MediaItemFromJson(json);
}
