import 'package:story_teller_nomad_landing_page/common/services/local_resource_service.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/models/media_item/media_item.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/models/photo_collection/photo_collection.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/models/video_collection/video_collection.dart';

abstract class MediaGalleryDataSource {
  Future<MediaItem> fetchPhotoUrls(String id);
  Future<MediaItem> fetchVideoUrls(String id);
  Future<PhotoCollection> fetchMediaPhotoCollection();
  Future<VideoCollection> fetchMediaVideoCollection();
}

class MediaGalleryDataSourceImpl implements MediaGalleryDataSource {
  final LocalResourceService localResourceService;
  MediaGalleryDataSourceImpl({required this.localResourceService});

  @override
  Future<PhotoCollection> fetchMediaPhotoCollection() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await localResourceService.loadJsonData('assets/json/photos.json');

    return PhotoCollection.fromJson(result["photos"]);
  }

  @override
  Future<VideoCollection> fetchMediaVideoCollection() async {
    await Future.delayed(Duration(seconds: 1));
    final result = await localResourceService.loadJsonData('assets/json/videos.json');
    return VideoCollection.fromJson(result);
  }

  @override
  Future<MediaItem> fetchPhotoUrls(String id) async {
    final photoCollection = await fetchMediaPhotoCollection();
    return photoCollection.all.firstWhere((mediaItem) => mediaItem.id == id);
  }

  @override
  Future<MediaItem> fetchVideoUrls(String id) async {
    final videoCollection = await fetchMediaVideoCollection();
    return videoCollection.videos.firstWhere((mediaItem) => mediaItem.id == id);
  }
}
