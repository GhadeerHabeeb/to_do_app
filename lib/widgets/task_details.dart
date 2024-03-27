

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:new_to_do_app/data/models/task.dart';
import 'package:new_to_do_app/utilis/utilis.dart';
import 'package:new_to_do_app/widgets/circle_container.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({Key? key,required this.task}) : super(key: key);
  final Task task;
  @override
  Widget build(BuildContext context) {
    final style =context.textTheme;
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
            CircleContainer(borderColor: task.category.color, child: Icon(task.category.icon,color: !task.isCompleted?task.category.color:task.category.color.withOpacity(.3),), color: task.category.color.withOpacity(.3)),
            Gap(16),
          Text(task.title,style:style.titleMedium?.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ) ,),
          Text(task.date,style: style.titleMedium,),
          Gap(16),
          Visibility(
            visible: !task.isCompleted,
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('task to be completed on ${task.date}'),
              Gap(10),
              Icon(Icons.check_rounded,color: task.category.color,),

            ],
          )),
          Gap(16),
          Divider(
            thickness: 1.5,
            color: task.category.color,
          ),
          Gap(16),
          Text(task.note.isEmpty?'there is no additional note':task.note),
          Gap(16),
          Visibility(
              visible: task.isCompleted,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('task completed '),
                  Gap(10),
                  Icon(Icons.check_box,color: task.category.color,),

                ],
              )),
        ],
      ),
    );
  }
}
