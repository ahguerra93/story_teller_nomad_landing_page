import 'package:get_it/get_it.dart';
import 'package:story_teller_nomad_landing_page/common/services/local_resource_service.dart';
import 'package:story_teller_nomad_landing_page/config/models/repo_config/repo_config.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/init_dependencies.dart';

final getIt = GetIt.instance;

void initializeDependencies() {
  getIt.registerLazySingleton(() => LocalResourceService());
  getIt.registerSingleton<RepoConfig>(RepoConfig(cloudName: 'dp1e3otpc', apiKey: '329245894549578'));
  initMediaGalleryDependencies(getIt);
}
