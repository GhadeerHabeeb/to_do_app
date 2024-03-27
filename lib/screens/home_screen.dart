


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:new_to_do_app/data/data.dart';
import 'package:new_to_do_app/data/models/task.dart';
import 'package:new_to_do_app/provider/provider_date.dart';
import 'package:new_to_do_app/provider/task/task_provider.dart';
import 'package:new_to_do_app/screens/create_task_screen.dart';
import 'package:new_to_do_app/utilis/helper.dart';
import 'package:new_to_do_app/utilis/task_category.dart';
import 'package:new_to_do_app/utilis/utilis.dart';
import 'package:new_to_do_app/widgets/comman_container.dart';
import 'package:new_to_do_app/widgets/display_list_of_task.dart';
import 'package:new_to_do_app/widgets/display_white_text.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final colors=context.colorScheme;
    final deviceSize=context.deviceSize;
    final taskState=ref.watch(taskProvider);
    final CompletedTask= _CompletedTask(taskState.tasks,ref);
    final InCompletedTask= _inCompletedTask(taskState.tasks,ref);
    final selectedDate=ref.watch(providerDate);

    return Scaffold(
      body:  Stack(
        children: [
          Column(
            children: [
              Container(
                height: deviceSize.height*0.3,
                width: deviceSize.width,
                color: colors.primary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Gap(20),
                     InkWell(
                       onTap: (){
                         Helpers.selectDate(context, ref);
                       },
                       child: DisplayWhiteText(
                           text: '${DateFormat.yMMMd().format(selectedDate)}',
                           fontSize: 20,
                           fontWeight: FontWeight.normal),
                     ),
                    DisplayWhiteText(
                        text: 'My To Do List',
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                   ],
                 ),
              ),


            ],
          ),
          Positioned(
              top: 130,
              left: 0,
              right: 0,
              child:
              SafeArea(
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      DisplayListOfTask(
                           tasks:InCompletedTask,
                        isCompleted: false,

                      ),

                
                      Gap(10),
                      Text('Completed',style: context.textTheme.headlineMedium,),
                      Gap(10),
                      DisplayListOfTask(
                        tasks:CompletedTask,isCompleted: true,),
                
                      Gap(10),
                      ElevatedButton(onPressed: (){

                          Navigator.pushNamed(context, 'add_task_screen');
                      }, child: DisplayWhiteText(text: 'Add New Task', fontSize: 20,fontWeight: FontWeight.w100,)),

                    ],
                  ),
                ),
              )
          )
        ],
      )
    );
  }
  List<Task> _CompletedTask(List<Task>tasks,WidgetRef ref){
    final selectedDate=ref.watch(providerDate);

    List<Task>FilterdTask=[];

    for(var task in tasks)
      {
        final dateTask=Helpers.isTaskFromSelectedDate(task, selectedDate);
         if(task.isCompleted&&dateTask)
           {
             FilterdTask.add(task);
           }
      }
         return FilterdTask;
  }

  List<Task> _inCompletedTask(List<Task>tasks,ref){
    final selectedDate=ref.watch(providerDate);
    List<Task>FilterdTask=[];

    for(var task in tasks)
    { final dateTask=Helpers.isTaskFromSelectedDate(task, selectedDate);
      if(!task.isCompleted&&dateTask)
      {
        FilterdTask.add(task);
      }
    }
    return FilterdTask;
  }
}
