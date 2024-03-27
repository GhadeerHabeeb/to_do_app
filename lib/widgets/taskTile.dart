


import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:new_to_do_app/data/models/task.dart';
import 'package:new_to_do_app/utilis/utilis.dart';
import 'package:new_to_do_app/widgets/circle_container.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({required this.task,Key? key, this.onComplete}) : super(key: key);
  final Task task;
  final Function(bool?)?onComplete;
  @override
  Widget build(BuildContext context) {
    final colors=context.colorScheme;
    final style=context.textTheme;
    final double iconOpacity=task.isCompleted?0.3:0.5;
    final double backGroundOpacity=task.isCompleted?0.1:.4;
    final textDecoration=task.isCompleted?TextDecoration.lineThrough:TextDecoration.none;
    final fontWeight=task.isCompleted?FontWeight.normal:FontWeight.bold;
    return  Padding(
      padding: const EdgeInsets.all(9.0),
      child: Row(
        children: [
          CircleContainer(
              child: Icon(task.category.icon,color:!task.isCompleted? task.category.color:task.category.color.withOpacity(iconOpacity),),
              borderColor: task.category.color.withOpacity(iconOpacity),
              color: task.category.color.withOpacity(backGroundOpacity)),
          Gap(20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task.title,style: style.titleMedium?.copyWith(
                  decoration: textDecoration,
                  fontWeight: fontWeight,
                  fontSize: 20
                ),),
                Text(task.time,style: style.titleMedium?.copyWith(
                  decoration: textDecoration,

                ),),
              ],
            ),
          ),
          Checkbox(
              value: task.isCompleted,
              onChanged: onComplete)
        ],
      ),
    );
  }
}
