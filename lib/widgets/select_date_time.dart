

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:new_to_do_app/provider/povider_time.dart';
import 'package:new_to_do_app/provider/provider_date.dart';
import 'package:new_to_do_app/utilis/helper.dart';
import 'package:new_to_do_app/widgets/common_text_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import'package:intl/intl.dart';

class SelectDateTime extends ConsumerWidget  {
  const SelectDateTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final date =ref.watch(providerDate);
    final time =ref.watch(providerTime);
    return   Row(
      children: [
        Expanded(
            child: CommonTextField(
              title: 'date',
              TextHint: DateFormat.yMMMd().format(date),
              suffixIcon: IconButton(icon: FaIcon(FontAwesomeIcons.calendar),
                onPressed: ()=> _selectDate(context,ref)),
              readyOnly: true,)),
        Gap(10),
        Expanded(
            child: CommonTextField(
              title: 'Time',
              TextHint: '${Helpers.timeToString(time)}',
              suffixIcon: IconButton(icon:FaIcon(FontAwesomeIcons.clock) ,
                onPressed: ()=>_selectTime(context,ref),),
              readyOnly: true,)),

      ],
    );
  }
  void _selectTime(BuildContext context,ref )async{
    TimeOfDay?pickedTime=await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now());
    if(pickedTime!=null)
      {
        ref.read(providerTime.notifier).state=pickedTime;
      }
  }
  void _selectDate(BuildContext context,ref )async{
    final initialDate=ref.read(providerDate);
    DateTime?pickedDate=await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(2023),
        lastDate: DateTime(2090),

    );
    if(pickedDate!=null)
    {
        ref.read(providerDate.notifier).state=pickedDate;
    }
  }
}
