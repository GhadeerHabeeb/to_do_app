


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:new_to_do_app/data/data.dart';
import 'package:new_to_do_app/data/models/task.dart';
import 'package:new_to_do_app/provider/task/task_provider.dart';
import 'package:new_to_do_app/utilis/app_alert.dart';
import 'package:new_to_do_app/utilis/utilis.dart';
import 'package:new_to_do_app/widgets/comman_container.dart';
import 'package:new_to_do_app/widgets/taskTile.dart';
import 'package:new_to_do_app/widgets/task_details.dart';


class DisplayListOfTask extends ConsumerWidget {
    DisplayListOfTask({required this.tasks,  required this.isCompleted,Key? key}) : super(key: key);
final List<Task>tasks;
final bool isCompleted;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final deviceSize=context.deviceSize;
    final emptyTaskManeger=isCompleted?'there is no completed task':'there is nothing toDo in the list';
    final height=isCompleted?deviceSize.height*.25:deviceSize.height*.3;
    return CommonContainer(
      height:height ,
      child:tasks.isEmpty?Center(
        child:Text(emptyTaskManeger,style: context.textTheme.headlineMedium,) ,
      ):
      ListView.separated(
        shrinkWrap: true,
        itemCount:tasks.length,
        padding: EdgeInsets.zero,
        itemBuilder: (ctx,index){
          final task=tasks[index];
          return InkWell(
            onLongPress: (){
              AppAlert.showDeletedAlertDailog(context,ref,task);
            },
              onTap: ()async{
              //Show details
                await showModalBottomSheet (
                    context: context,
                    builder: (ctx){
                      return TaskDetails(task:task);
                    });
              },
              child: TaskTile(
                task:task,
                onComplete: (val){
                  ref.read(taskProvider.notifier).
                  updateTask(task).
                  then((value){
                    AppAlert.displaySnackBar(context, task.isCompleted?'task inCompleted':'task completed');
                  });},));
        }, separatorBuilder: (BuildContext context, int index) {
          return Divider(
           thickness: 1.5,
          );
      },),);
  }
}
