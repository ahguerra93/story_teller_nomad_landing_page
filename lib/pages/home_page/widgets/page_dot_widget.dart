import 'package:flutter/material.dart';

class PageDotWidget extends StatelessWidget {
  const PageDotWidget({
    this.onTap,
    this.activeSize,
    this.active = false,
    super.key,
  });
  final bool active;
  final double? activeSize;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final size = activeSize ?? 20;
    return InkWell(
        onTap: onTap,
        child: SizedBox(
          width: size,
          height: size,
          child: AnimatedContainer(
            constraints: BoxConstraints(
                maxHeight: active ? size : size * (2 / 3),
                maxWidth: active ? size : size * (2 / 3)),
            duration: Duration(milliseconds: 300),
            width: active ? size : size * (2 / 3),
            height: active ? size : size * (2 / 3),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(active ? 255 : 125),
              shape: BoxShape.circle,
            ),
          ),
        ));
  }
}
