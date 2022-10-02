import 'package:flutter/material.dart';
import 'package:flutter_example/widgets/custom_on_click.dart';

class CustomTextButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  final Color? textColor;

  const CustomTextButton({
    super.key,
    required this.text,
    this.onPressed,
    this.textStyle,
    this.textColor,
  });

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomOnClick(
      onTap: widget.onPressed,
      onShowHoverHighlight: (value) => setState(() => isHovered = value),
      child: Text(
        widget.text,
        style: (widget.textStyle ?? theme.textTheme.subtitle1)!.copyWith(
          color: isHovered ? Colors.blue : widget.textColor,
        ),
      ),
    );
  }
}
