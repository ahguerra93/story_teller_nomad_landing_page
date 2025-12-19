import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:story_teller_nomad_landing_page/common/widgets/custom_circular_progress_indicator.dart';
import 'package:story_teller_nomad_landing_page/config/router/routes.dart';
import 'package:story_teller_nomad_landing_page/pages/gallery_dashboard/gallery_dashboard.dart';
import 'package:story_teller_nomad_landing_page/pages/gallery_dashboard/presentation/cubit/photos_dashboard/photos_dashboard_cubit_cubit.dart';

class PhotosPage extends StatelessWidget {
  const PhotosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => PhotosDashboardCubitCubit()..load(), child: _Widget());
  }
}

class _Widget extends StatelessWidget {
  const _Widget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PhotosDashboardCubitCubit, PhotosDashboardCubitState>(
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: state.when(
              error: (message) => Center(key: Key('Error_photos_page'), child: Text('Error: $message')),
              loading: () => Center(key: Key('Loading_photos_page'), child: CustomCircularProgressIndicator()),
              success: (photoCollection) => GalleryPage(
                covers: photoCollection.intertwined,
                onSelected: (item) => context.go('${AppRoutes.mediaGallery.path}?type=photo&id=${item.id}'),
              ),
            ),
          );
        },
      ),
    );
  }
}
