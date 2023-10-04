import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign? textAlign;
  final int? maxLines;

  const CommonText({
    super.key,
    this.maxLines,
    this.textAlign,
    required this.text,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.left,
      maxLines: maxLines ?? 1,
      overflow: TextOverflow.ellipsis,
      style: style,
    );
  }
}
