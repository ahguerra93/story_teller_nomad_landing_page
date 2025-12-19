import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:story_teller_nomad_landing_page/common/widgets/custom_circular_progress_indicator.dart';
import 'package:story_teller_nomad_landing_page/config/router/routes.dart';
import 'package:story_teller_nomad_landing_page/pages/gallery_dashboard/gallery_dashboard.dart';
import 'package:story_teller_nomad_landing_page/pages/gallery_dashboard/presentation/cubit/videos_dashboard/videos_dashboard_cubit.dart';

class VideosPage extends StatelessWidget {
  const VideosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => VideosDashboardCubit()..load(), child: _Widget());
  }
}

class _Widget extends StatelessWidget {
  const _Widget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<VideosDashboardCubit, VideosDashboardState>(
        builder: (context, state) {
          return state.when(
            error: (message) => Center(key: Key('Error_videos_page'), child: Text('Error: $message')),
            loading: () => Center(key: Key('Loading_videos_page'), child: CustomCircularProgressIndicator()),
            success: (videoCollection) => GalleryPage(
              covers: videoCollection.videos,
              onSelected: (item) => context.go('${AppRoutes.mediaGallery.path}?type=video&id=${item.id}'),
            ),
          );
        },
      ),
    );
  }
}
