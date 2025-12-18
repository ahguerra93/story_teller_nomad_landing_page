import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/models/media_item/media_item.dart';

part 'video_collection.freezed.dart';
part 'video_collection.g.dart';

@freezed
abstract class VideoCollection with _$VideoCollection {
  factory VideoCollection({@Default([]) List<MediaItem> videos}) = _VideoCollection;

  factory VideoCollection.fromJson(Map<String, dynamic> json) => _$VideoCollectionFromJson(json);
}
