import 'package:flutter/material.dart';

class PageDotWidget extends StatelessWidget {
  const PageDotWidget({
    this.onTap,
    required this.mobile,
    this.active = false,
    required this.darkMode,
    super.key,
  });
  final bool active;
  final bool mobile;
  final void Function()? onTap;
  final bool darkMode;

  @override
  Widget build(BuildContext context) {
    final size = mobile ? 12.0 : 20.0;
    return InkWell(
        onTap: onTap,
        child: SizedBox(
          width: size,
          height: size,
          child: AnimatedContainer(
            constraints:
                BoxConstraints(maxHeight: active ? size : size * (2 / 3), maxWidth: active ? size : size * (2 / 3)),
            duration: Duration(milliseconds: 300),
            width: active ? size : size * (2 / 3),
            height: active ? size : size * (2 / 3),
            decoration: BoxDecoration(
                color: (darkMode ? Colors.white : Colors.black).withAlpha(active ? 255 : 0),
                shape: BoxShape.circle,
                border: Border.all(width: mobile ? 1.0 : 2.0, color: (darkMode ? Colors.white : Colors.black))),
          ),
        ));
  }
}
