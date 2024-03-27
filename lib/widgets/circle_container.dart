

import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  CircleContainer({required this.borderColor, required this.child, this.borderWidth, required this.color,Key? key}) : super(key: key);
  final Color color;
  final Widget child;
  final double? borderWidth;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(
          width: borderWidth ?? 2,
          color: borderColor,
        ),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
