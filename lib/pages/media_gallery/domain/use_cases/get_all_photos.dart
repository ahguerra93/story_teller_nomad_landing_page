import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/models/photo_collection/photo_collection.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/repositories/media_gallery_repository.dart';

class GetAllPhotos {
  final MediaGalleryRepository repository;
  GetAllPhotos({required this.repository});
  Future<(PhotoCollection?, Exception?)> call() {
    return repository.fetchMediaPhotoGroups();
  }
}
