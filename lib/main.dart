import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_to_do_app/app/to_do_App.dart';


void main() {
   runApp( ProviderScope(child: const ToDoApp()));

}



