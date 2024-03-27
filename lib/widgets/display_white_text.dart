

import 'package:flutter/material.dart';
import 'package:new_to_do_app/utilis/utilis.dart';

class DisplayWhiteText extends StatelessWidget {
  const DisplayWhiteText({
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    Key? key}) : super(key: key);
  final String text;
  final double fontSize;
  final fontWeight;
  @override
  Widget build(BuildContext context) {
    return   Text(text,
        style: context.textTheme.headlineSmall?.copyWith(
        color: context.colorScheme.surface,
        fontWeight: fontWeight,
        fontSize: fontSize,
    ),);
  }
}
