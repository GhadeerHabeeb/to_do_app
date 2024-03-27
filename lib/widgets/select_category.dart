


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:new_to_do_app/provider/category_provider.dart';
import 'package:new_to_do_app/utilis/task_category.dart';
import 'package:new_to_do_app/utilis/utilis.dart';
import 'package:new_to_do_app/widgets/circle_container.dart';
import 'package:riverpod/riverpod.dart';
class SelectCategory extends ConsumerWidget {
  const SelectCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final categories=TaskCategories.values.toList();
    final selectedCategory=ref.watch(CategoryProvider);
    return   SizedBox(
      height: 60,
      child: Row(
        children: [
          Text('category',style: context.textTheme.titleLarge,),
          Gap(8),
          Expanded(child:
          ListView.separated(
            physics: AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext ctx,int index){
                return InkWell(
                  onTap: (){
                    ref.read(CategoryProvider.notifier).state=categories[index];
                    print(categories[index].name);
                  },
                  child: CircleContainer(
                    borderColor:categories[index].color,
                    color: categories[index].color.withOpacity(.3),
                    child: Icon(
                        categories[index].icon,
                    color: categories[index].color==selectedCategory?context.colorScheme.primary:categories[index].color,),

                  ),
                );
              },
              separatorBuilder: (ctx,index){
                return Gap(
                   10,
                );
              },
              itemCount: categories.length)),
        ],
      ),
    );
  }
}
