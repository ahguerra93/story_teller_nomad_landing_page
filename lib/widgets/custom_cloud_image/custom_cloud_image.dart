import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:story_teller_nomad_landing_page/config/models/repo_config/repo_config.dart';

class CustomCloudImage extends StatelessWidget {
  const CustomCloudImage({required this.id, this.placeHolder, this.fit, this.alignment = Alignment.center, super.key});
  final String id;
  final BoxFit? fit;
  final AlignmentGeometry alignment;
  final Widget? placeHolder;

  @override
  Widget build(BuildContext context) {
    final GetIt getIt = GetIt.I;
    return Image.network(
      'https://res.cloudinary.com/${getIt.get<RepoConfig>().cloudName}/image/upload/$id',
      headers: {'Origin': 'https://localhost'},
      fit: fit,
      alignment: alignment,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return placeHolder ?? Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
