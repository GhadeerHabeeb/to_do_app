



import 'package:flutter/material.dart';
import 'package:new_to_do_app/utilis/utilis.dart';

class CommonContainer extends StatelessWidget {
  const CommonContainer({required this.height, required this.child,Key? key}) : super(key: key);
  final Widget child;
  final double height;
  @override
  Widget build(BuildContext context) {
    final deviceSize=context.deviceSize;
    return Container(
        width: deviceSize.width,
        height: height,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
    color: context.colorScheme.primaryContainer
    ),
    child:child,
    );
  }
}
