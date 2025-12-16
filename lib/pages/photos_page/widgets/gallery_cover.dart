import 'package:flutter/material.dart';
import 'package:story_teller_nomad_landing_page/pages/photos_page/data/model/media_item.dart';
import 'package:story_teller_nomad_landing_page/widgets/custom_cloud_image/custom_cloud_image.dart';

class GalleryCover extends StatefulWidget {
  const GalleryCover({
    super.key,
    required this.item,
    required this.isFocused,
    required this.onFocused,
    this.onExit,
  });

  final MediaItem item;
  final bool isFocused;
  final void Function()? onFocused;
  final void Function()? onExit;

  @override
  State<GalleryCover> createState() => _GalleryCoverState();
}

class _GalleryCoverState extends State<GalleryCover> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: MouseRegion(
        onEnter: (_) {
          widget.onFocused?.call();
        },
        onExit: (_) {
          widget.onExit?.call();
        },
        child: InkWell(
          onLongPress: () {
            widget.onFocused?.call();
          },
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomCloudImage(
                  id: widget.item.id,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: AnimatedOpacity(
                  opacity: widget.isFocused ? 0.4 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: Container(color: Colors.black),
                ),
              ),
              Align(
                alignment: Alignment(-0.2, 0.5),
                child: AnimatedOpacity(
                  opacity: widget.isFocused ? 0.4 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 10,
                      children: [
                        if (widget.item.subtitle != null)
                          Text(
                            widget.item.subtitle!,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                              letterSpacing: 1.5,
                              wordSpacing: 3.0,
                            ),
                          ),
                        Text(
                          widget.item.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                            wordSpacing: 4.0,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          height: 4,
                          width: 100,
                          color: Color.fromRGBO(207, 87, 72, 1.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
