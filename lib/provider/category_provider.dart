import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_to_do_app/utilis/task_category.dart';
final CategoryProvider=StateProvider.autoDispose<TaskCategories>((ref) {
  return TaskCategories.others;
}
) ;