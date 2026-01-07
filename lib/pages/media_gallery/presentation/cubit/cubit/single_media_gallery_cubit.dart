import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_teller_nomad_landing_page/injection.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/models/media_item/media_item.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/models/media_item/media_type.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/use_cases/get_all_photos.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/use_cases/get_all_videos.dart';

part 'single_media_gallery_state.dart';
part 'single_media_gallery_cubit.freezed.dart';

class SingleMediaGalleryCubit extends Cubit<SingleMediaGalleryState> {
  final GetAllPhotos _getAllPhotos;
  final GetAllVideos _getAllVideos;
  final MediaType type;
  SingleMediaGalleryCubit(this.type)
    : _getAllPhotos = getIt<GetAllPhotos>(),
      _getAllVideos = getIt<GetAllVideos>(),
      super(SingleMediaGalleryState.loading());

  Future<void> loadMedia() async {
    emit(SingleMediaGalleryState.loading());
    if (type == MediaType.photo) {
      await _loadPhotos();
    } else if (type == MediaType.video) {
      await _loadVideos();
    }
  }

  Future<void> _loadPhotos() async {
    final (result, error) = await _getAllPhotos.call();
    if (error != null) {
      emit(SingleMediaGalleryState.error(error.toString()));
    } else if (result == null) {
      emit(SingleMediaGalleryState.error('No photos found'));
    } else {
      emit(SingleMediaGalleryState.success(result.all));
    }
  }

  Future<void> _loadVideos() async {
    final (result, error) = await _getAllVideos.call();
    if (error != null) {
      emit(SingleMediaGalleryState.error(error.toString()));
    } else if (result == null) {
      emit(SingleMediaGalleryState.error('No videos found'));
    } else {
      emit(SingleMediaGalleryState.success(result.videos));
    }
  }
}
