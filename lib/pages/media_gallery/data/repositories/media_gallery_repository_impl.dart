import 'package:story_teller_nomad_landing_page/pages/media_gallery/data/datasources/media_gallery_data_sources.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/models/media_item/media_item.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/models/media_item/media_type.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/models/photo_collection/photo_collection.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/models/video_collection/video_collection.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/repositories/media_gallery_repository.dart';

class MediaGalleryRepositoryImpl implements MediaGalleryRepository {
  final MediaGalleryDataSource dataSource;

  MediaGalleryRepositoryImpl({required this.dataSource});

  @override
  Future<(PhotoCollection?, Exception?)> fetchMediaPhotoGroups() async {
    try {
      final result = await dataSource.fetchMediaPhotoCollection();
      return (result, null);
    } on Exception catch (e) {
      return (null, e);
    }
  }

  @override
  Future<(VideoCollection? result, Exception? error)> fetchMediaVideoGroups() async {
    try {
      final result = await dataSource.fetchMediaVideoCollection();
      return (result, null);
    } on Exception catch (e) {
      return (null, e);
    }
  }

  @override
  Future<(MediaItem?, Exception?)> fetchMediaGroup({required String id, required MediaType type}) async {
    try {
      switch (type) {
        case MediaType.photo:
          final result = await dataSource.fetchPhotoUrls(id);
          return (result, null);
        case MediaType.video:
          final result = await dataSource.fetchVideoUrls(id);
          return (result, null);
      }
    } on Exception catch (e) {
      return (null, e);
    }
  }
}
