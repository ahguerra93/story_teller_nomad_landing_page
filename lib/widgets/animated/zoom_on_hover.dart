import 'package:flutter/material.dart';

class ZoomOnHover extends StatefulWidget {
  final Widget child;
  final double zoomFactor;
  final Duration duration;
  final void Function(bool value)? onHover;
  final void Function()? onTap;

  const ZoomOnHover({
    super.key,
    required this.child,
    this.zoomFactor = 1.1,
    this.onHover,
    this.onTap,
    this.duration = const Duration(milliseconds: 200),
  });

  @override
  _ZoomOnHoverState createState() => _ZoomOnHoverState();
}

class _ZoomOnHoverState extends State<ZoomOnHover> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        widget.onHover?.call(true);
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        widget.onHover?.call(false);
      },
      child: InkWell(
        onTap: () {
          debugPrint('tapped');
          widget.onTap?.call();
        },
        child: ClipRect(
          child: AnimatedAlign(
            duration: widget.duration,
            alignment: Alignment.center,
            child: AnimatedContainer(
              duration: widget.duration,
              color: Colors.black,
              curve: Curves.easeOut,
              transform: Matrix4.identity()
                ..scale(_isHovered ? widget.zoomFactor : 1.0,
                    _isHovered ? widget.zoomFactor : 1.0),
              transformAlignment: Alignment.center,
              child: AnimatedPhysicalModel(
                duration: widget.duration,
                shape: BoxShape.rectangle,
                elevation: _isHovered ? 8 : 0,
                color: Colors.transparent,
                shadowColor: Colors.black,
                child: AnimatedOpacity(
                    duration: widget.duration,
                    opacity: _isHovered ? 0.5 : 1,
                    child: widget.child),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
