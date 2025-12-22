import 'package:flutter/material.dart';
import 'package:story_teller_nomad_landing_page/widgets/animated/zoom_on_hover.dart';
import 'package:story_teller_nomad_landing_page/widgets/custom_cloud_image/custom_cloud_image.dart';

class AnimatedCover extends StatefulWidget {
  const AnimatedCover({required this.path, required this.title, this.onTap, super.key});
  final String path;
  final String title;
  final void Function()? onTap;

  @override
  State<AnimatedCover> createState() => _AnimatedCoverState();
}

class _AnimatedCoverState extends State<AnimatedCover> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return ZoomOnHover(
      onTap: widget.onTap,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final height = constraints.maxHeight;
          final width = constraints.maxWidth;
          return Stack(
            children: [
              AspectRatio(
                aspectRatio: width / height,
                child: CustomCloudImage(id: widget.path, fit: BoxFit.cover, alignment: Alignment.center),
              ),
              Center(child: Text(widget.title, style: TextStyle(fontSize: 28, wordSpacing: 5.0, letterSpacing: 5.0))),
            ],
          );
        },
      ),
    );
  }
}
