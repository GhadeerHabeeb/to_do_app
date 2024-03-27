



import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_to_do_app/data/datasource/task_datasource.dart';
import 'package:new_to_do_app/data/repositories/task_repositories.dart';
import 'package:new_to_do_app/data/repositories/task_repository_impl.dart';

final TaskDatasourcePrevoider=Provider<TaskDatasource>((ref){

  return TaskDatasource();
});