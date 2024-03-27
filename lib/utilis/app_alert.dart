import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_to_do_app/data/models/task.dart';
import 'package:new_to_do_app/provider/task/task_notifier.dart';
import 'package:new_to_do_app/provider/task/task_provider.dart';
import 'package:new_to_do_app/utilis/utilis.dart';

class AppAlert{
  AppAlert._();
  static displaySnackBar(BuildContext context,String message){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(
          message,style: context.textTheme.bodyLarge?.copyWith(
          color: context.colorScheme.surface,
        ),
        ),
          backgroundColor: context.colorScheme.primary,
        ));

  }
  static Future<void>showDeletedAlertDailog(
      BuildContext context ,
      WidgetRef ref,
      Task task)
  async {
    Widget cancelButton=TextButton(onPressed: (){Navigator.pop(context);},
        child:Text('No',style: context.textTheme.titleLarge,) );
    Widget deleteButton=TextButton(onPressed: ()async{
      await ref.read(taskProvider.notifier).deleteTask(task).then((value) {
        displaySnackBar(context, 'task has been deleted successfully');
        Navigator.pop(context);
      });

    },
        child:Text('Yes',style: context.textTheme.titleLarge,) );
    AlertDialog alert =AlertDialog(
      title: Text('Are You Sure Want To Delete',style: context.textTheme.titleLarge?.copyWith(color:Colors.red ),),
      actions: [
        cancelButton,
        deleteButton,
      ],

    );
     await showDialog(context: context,builder: (ctx){
       return alert;
     }
       
     ) ;
  }
}