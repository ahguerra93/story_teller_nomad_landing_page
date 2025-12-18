import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_teller_nomad_landing_page/injection.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/models/media_item/media_item.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/models/media_item/media_type.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/use_cases/get_media_group.dart';

part 'media_gallery_state.dart';
part 'media_gallery_cubit.freezed.dart';

class MediaGalleryCubit extends Cubit<MediaGalleryState> {
  final GetMediaGroup _getMediaGroup;
  final String id;
  final MediaType type;

  MediaGalleryCubit({required this.id, required this.type})
    : _getMediaGroup = getIt<GetMediaGroup>(),
      super(MediaGalleryState.loading());

  Future<void> loadMediaGroup() async {
    emit(MediaGalleryState.loading());
    final (result, error) = await _getMediaGroup.call(id: id, type: type);
    if (error != null) {
      emit(MediaGalleryState.error(error.toString()));
    } else if (result == null) {
      emit(MediaGalleryState.error('No media found'));
    } else {
      emit(MediaGalleryState.success(result));
    }
  }
}
