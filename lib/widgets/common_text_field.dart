import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:new_to_do_app/utilis/utilis.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    required this.title,
    required this.TextHint ,
    this.controller,
    this.maxLine,
    this.suffixIcon,
    Key? key, this.readyOnly=false}) : super(key: key);
  final String title;
  final String TextHint;
  final TextEditingController? controller;
  final int? maxLine;
  final Widget?suffixIcon;
  final bool readyOnly;
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title,style: context.textTheme.titleLarge,),
        Gap(10),
        TextField(
          controller: controller,
          decoration:InputDecoration(
            hintText: TextHint,
            suffixIcon: suffixIcon,
          ),
          onTapOutside: (event){
            FocusManager.instance.primaryFocus?.unfocus();
          },
          onChanged: (value)
          {},
          maxLines:maxLine ,
          readOnly: readyOnly,


        ),
      ],
    );
  }
}
