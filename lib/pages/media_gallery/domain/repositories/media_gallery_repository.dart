import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/models/media_item/media_item.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/models/media_item/media_type.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/models/photo_collection/photo_collection.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/models/video_collection/video_collection.dart';

abstract class MediaGalleryRepository {
  Future<(MediaItem? result, Exception? error)> fetchMediaGroup({required String id, required MediaType type});
  Future<(PhotoCollection? result, Exception? error)> fetchMediaPhotoGroups();
  Future<(VideoCollection? result, Exception? error)> fetchMediaVideoGroups();
}
