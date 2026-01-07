part of 'single_media_gallery_cubit.dart';

@freezed
class SingleMediaGalleryState with _$SingleMediaGalleryState {
  const factory SingleMediaGalleryState.loading() = _Loading;
  const factory SingleMediaGalleryState.error(String message) = _Error;
  const factory SingleMediaGalleryState.success(List<MediaItem> mediaItems) = _Success;
}
