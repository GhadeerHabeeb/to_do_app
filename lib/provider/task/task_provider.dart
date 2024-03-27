


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_to_do_app/provider/task/Task_Repository_Provider.dart';
import 'package:new_to_do_app/provider/task/task_notifier.dart';
import 'package:new_to_do_app/provider/task/task_state.dart';

final taskProvider =StateNotifierProvider<TaskNotifier,TaskState>((ref){
  final repository=ref.watch(TaskRepositoryProvider);
  return TaskNotifier(repository) ;
});