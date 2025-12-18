import 'package:get_it/get_it.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/data/datasources/media_gallery_data_sources.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/data/repositories/media_gallery_repository_impl.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/repositories/media_gallery_repository.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/use_cases/get_all_photos.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/use_cases/get_all_videos.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/use_cases/get_media_group.dart';

void initMediaGalleryDependencies(GetIt sl) {
  sl.registerLazySingleton<GetAllPhotos>(() => GetAllPhotos(repository: sl()));
  sl.registerLazySingleton<GetAllVideos>(() => GetAllVideos(repository: sl()));
  sl.registerLazySingleton<GetMediaGroup>(() => GetMediaGroup(repository: sl()));
  sl.registerLazySingleton<MediaGalleryRepository>(() => MediaGalleryRepositoryImpl(dataSource: sl()));
  sl.registerLazySingleton<MediaGalleryDataSource>(() => MediaGalleryDataSourceImpl(localResourceService: sl()));
}
