import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/models/video_collection/video_collection.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/repositories/media_gallery_repository.dart';

class GetAllVideos {
  final MediaGalleryRepository repository;
  GetAllVideos({required this.repository});
  Future<(VideoCollection?, Exception?)> call() {
    return repository.fetchMediaVideoGroups();
  }
}
