import 'package:flutter/material.dart';

class CustomOnClick extends StatelessWidget {
  const CustomOnClick({
    super.key,
    required this.child,
    this.onTap,
    this.onShowHoverHighlight,
  });

  final Widget child;
  final GestureTapCallback? onTap;
  final ValueChanged<bool>? onShowHoverHighlight;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: FocusableActionDetector(
          onShowHoverHighlight: onShowHoverHighlight,
          child: child,
        ),
      ),
    );
  }
}
