import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/shared/components/components.dart';
import 'package:flutterapp/shared/cubit/cubit.dart';
import 'package:flutterapp/shared/cubit/states.dart';

class NewTasksScreen extends StatelessWidget {
//بدها ليست

/*late List<Map> tasks;
NewTasksScreen({
  required this.tasks,
});*/


  @override
  Widget build(BuildContext context) {
    //padding حاخدو برا لحالو لاني حستخدموا في 3 سكرينات
    // حوديه على الكومبوننت
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        var tasks = AppCubit.get(context).newTasks;

       return tasksBuilder(
       tasks: tasks,
       );


      },
    );
  }
}
/*Center(
      child: Text(
           'New Tasks',
        style: TextStyle(
          color: Colors.black,
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
        ),
    ); */

//ConditionalBuilder(
//          condition: tasks.length > 0,
//          builder:(context) =>ListView.separated(
//            itemBuilder: (context,index)=>buildTaskItem(tasks[index],context),
//            separatorBuilder: (context,index)=> Padding(
//              padding: const EdgeInsetsDirectional.only(
//                start: 20.0,
//              ),
//              child: Container(
//                width: double.infinity,
//                height: 1.0,
//                color: Colors.grey[300],
//              ),
//            ),
//            itemCount: tasks.length,
//          ),
//          fallback: (context)=> Center(
//            child: Column (
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: [
//                Icon(
//                  Icons.menu,
//                  size: 100.0,
//                  color: Colors.grey,
//                ),
//                Text(
//                  'No Tasks Yet, Please Add Some Tasks',
//                  style: TextStyle(
//                    fontSize:16.0 ,
//                    fontWeight: FontWeight.bold,
//                    color: Colors.grey,
//                  ),
//                ),
//              ],
//            ),
//          ),
//
//
//        );