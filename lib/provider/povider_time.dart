import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final providerTime=StateProvider<TimeOfDay>((ref) {
  return TimeOfDay.now();
}
) ;