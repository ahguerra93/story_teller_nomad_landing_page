import 'package:go_router/go_router.dart';
import 'package:story_teller_nomad_landing_page/config/router/routes.dart';
import 'package:story_teller_nomad_landing_page/pages/contact_page/contact_page.dart';
import 'package:story_teller_nomad_landing_page/pages/gallery_dashboard/photos_page.dart';
import 'package:story_teller_nomad_landing_page/pages/gallery_dashboard/videos_page.dart';
import 'package:story_teller_nomad_landing_page/pages/home_page/home_page.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/models/media_item/media_type.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/presentation/multiple_media_gallery_page.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/presentation/single_media_gallery_page.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(path: AppRoutes.home.path, builder: (context, state) => HomePage()),
    GoRoute(path: AppRoutes.contact.path, builder: (context, state) => ContactPage()),
    GoRoute(path: AppRoutes.photos.path, builder: (context, state) => PhotosPage()),
    GoRoute(path: AppRoutes.videos.path, builder: (context, state) => VideosPage()),
    GoRoute(
      path: AppRoutes.mediaGallery.path,
      builder: (context, state) {
        final typeParam = state.uri.queryParameters['type'] ?? 'photo';
        final idParam = state.uri.queryParameters['id'] ?? '';
        return MediaGalleryPage(id: idParam, type: typeParam == 'photo' ? MediaType.photo : MediaType.video);
      },
    ),
    GoRoute(
      path: AppRoutes.singleMediaGallery.path,
      builder: (context, state) {
        final typeParam = state.uri.queryParameters['type'] ?? 'photo';
        final idParam = state.uri.queryParameters['index'] ?? '';
        return SingleMediaGalleryPage(
          index: int.tryParse(idParam) ?? 0,
          type: typeParam == 'photo' ? MediaType.photo : MediaType.video,
        );
      },
    ),
  ],
);
