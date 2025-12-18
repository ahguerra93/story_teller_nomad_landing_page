import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/models/media_item/media_item.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/models/media_item/media_type.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/repositories/media_gallery_repository.dart';

class GetMediaGroup {
  final MediaGalleryRepository repository;
  GetMediaGroup({required this.repository});
  Future<(MediaItem?, Exception?)> call({required String id, required MediaType type}) {
    return repository.fetchMediaGroup(id: id, type: type);
  }
}
