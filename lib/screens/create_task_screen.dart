



import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:new_to_do_app/data/models/task.dart';
import 'package:new_to_do_app/provider/category_provider.dart';
import 'package:new_to_do_app/provider/povider_time.dart';
import 'package:new_to_do_app/provider/provider_date.dart';
import 'package:new_to_do_app/provider/task/task_notifier.dart';
import 'package:new_to_do_app/provider/task/task_provider.dart';
import 'package:new_to_do_app/utilis/app_alert.dart';
import 'package:new_to_do_app/utilis/helper.dart';
import 'package:new_to_do_app/utilis/task_category.dart';
import 'package:new_to_do_app/widgets/common_text_field.dart';
import 'package:new_to_do_app/widgets/display_white_text.dart';
import 'package:new_to_do_app/widgets/select_category.dart';
import 'package:new_to_do_app/widgets/select_date_time.dart';

class TaskScreen extends ConsumerStatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends ConsumerState<TaskScreen> {
  final TextEditingController _TitleController=TextEditingController();
  final TextEditingController _NoteController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: DisplayWhiteText(text: 'Add a New Task', fontSize: 20,fontWeight: FontWeight.bold,),
     ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CommonTextField(
                title: 'Task Title',
                TextHint: 'Enter Task Title',
              controller: _TitleController,),
              Gap(16),
              SelectCategory(),
              Gap(16),
              SelectDateTime(),
              Gap(16),
              CommonTextField(
                title: 'Note',
                TextHint: 'Task Note',maxLine: 6,
              controller: _NoteController,),

              Gap(30),
              ElevatedButton(onPressed:()=> _CreateTask(context),
              child: DisplayWhiteText(text: 'Save', fontSize: 20,fontWeight: FontWeight.w100,)),
            ],
          ),
        ),
      ),
    );
  }
  void _CreateTask(BuildContext context)async{

    final title=_TitleController.text.trim();
    final note=_NoteController.text.trim();
    final time=ref.watch(providerTime);
    final date=ref.watch(providerDate);
    final category=ref.watch(CategoryProvider);

    if(title.isNotEmpty)
      {
        final task=Task(
            title: title,
            category:category ,
            time: Helpers.timeToString(time),
            date:DateFormat.yMMMd().format(date),
            note: note,
            isCompleted: false);
        await ref.read(taskProvider.notifier).createTask(task).then((value)
        {
          AppAlert.displaySnackBar(context, 'Task created Successfully');
          Navigator.pushNamed(context, 'home_screen');
        });
      }
    AppAlert.displaySnackBar(context, 'TITLE IS EMPITY');


  }
}
