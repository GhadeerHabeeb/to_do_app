
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_to_do_app/config/themes/app_theme.dart';
import 'package:new_to_do_app/screens/create_task_screen.dart';
import 'package:new_to_do_app/screens/home_screen.dart';

 class ToDoApp extends StatelessWidget {
   const ToDoApp({Key? key}) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       theme: AppTheme.light,
       initialRoute:'home_screen',
       routes: {
     'home_screen':(context)=>HomeScreen(),
         'add_task_screen':(context)=>TaskScreen(),

     },
     );
   }
 }
 