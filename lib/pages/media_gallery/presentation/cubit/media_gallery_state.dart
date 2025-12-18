part of 'media_gallery_cubit.dart';

@freezed
class MediaGalleryState with _$MediaGalleryState {
  const factory MediaGalleryState.loading() = _Loading;
  const factory MediaGalleryState.error(String message) = _Error;
  const factory MediaGalleryState.success(MediaItem mediaUrls) = _Success;
}
