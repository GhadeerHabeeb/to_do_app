import 'package:flutter_riverpod/flutter_riverpod.dart';
final providerDate=StateProvider<DateTime>((ref) {
  return DateTime.now();
}
) ;