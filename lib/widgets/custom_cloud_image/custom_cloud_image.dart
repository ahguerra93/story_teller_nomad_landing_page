import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:story_teller_nomad_landing_page/config/models/repo_config/repo_config.dart';

class CustomCloudImage extends StatelessWidget {
  const CustomCloudImage({
    required this.id,
    this.placeHolder,
    this.fit,
    this.alignment = Alignment.center,
    this.fullQuality = false,
    this.width,
    this.height,
    super.key,
  });
  final String id;
  final BoxFit? fit;
  final Alignment alignment;
  final Widget? placeHolder;
  final bool fullQuality;
  final int? width;
  final int? height;

  String _buildOptimizedUrl(String cloudName, String id) {
    String transformations = '';

    if (!fullQuality) {
      // For thumbnails/covers, limit max size but preserve aspect ratio
      transformations = '/w_1200,h_900,c_limit,q_auto:best,f_auto';
    } else if (width != null && height != null) {
      // Custom dimensions with high quality, preserve ratio
      transformations = '/w_$width,h_$height,c_limit,q_auto:best,f_auto';
    } else {
      // Full size with best quality
      transformations = '/q_auto:best,f_auto';
    }

    return 'https://res.cloudinary.com/$cloudName/image/upload$transformations/$id';
  }

  @override
  Widget build(BuildContext context) {
    final GetIt getIt = GetIt.I;
    final cloudName = getIt.get<RepoConfig>().cloudName;

    return RepaintBoundary(
      child: CachedNetworkImage(
        imageUrl: _buildOptimizedUrl(cloudName, id),
        httpHeaders: {'Origin': 'https://localhost'},
        fit: fit,
        alignment: alignment,
        memCacheWidth: !fullQuality ? 1200 : null,
        memCacheHeight: !fullQuality ? 1200 : null, // Square to handle any ratio
        maxWidthDiskCache: !fullQuality ? 1200 : 1500,
        maxHeightDiskCache: !fullQuality ? 1200 : 1500, // Square to handle any ratio
        placeholder: placeHolder != null
            ? (context, url) {
                return placeHolder!;
              }
            : null,
        errorWidget: (context, url, error) {
          return Center(child: Icon(Icons.error));
        },
      ),
    );
  }
}
