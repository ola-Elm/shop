import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/shared/components/components.dart';
import 'package:flutterapp/shared/cubit/cubit.dart';
import 'package:flutterapp/shared/cubit/states.dart';
import 'package:intl/intl.dart';


class HomeScreen extends StatelessWidget
  {

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var timeController = TextEditingController();
  var titleController = TextEditingController();
  var dateController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDataBase(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener:(BuildContext context,AppStates state){
          if(state is AppInsertDataBaseStates){
                 Navigator.pop(context);
          }
         },
       builder: (BuildContext context , AppStates states){
        var  cubit= AppCubit.get(context);
         return Scaffold(
           key: scaffoldKey,
           //screens[currentIndex]
           appBar: AppBar(
             title: Text(
               cubit.titles[cubit.currentIndex],
             ),
           ),
           body:
           ConditionalBuilder(
             condition:  states is!  AppGetDataBaseLoadingStates,
            builder: (context)=> cubit.screens[cubit.currentIndex],//في حال تحقق الكونديشن
             fallback:(context)=> Center(child: CircularProgressIndicator()),//في حال عدم تحقق الكونديشن

          ),
            floatingActionButton: FloatingActionButton(
             onPressed: () async
             {
               if (cubit.isBottomSheetShown) {
                 if (formKey.currentState!.validate()) {

                   cubit.insertDataBase(
                       title: titleController.text,
                       date: dateController.text,
                       time: timeController.text,
                   );

                   /* insertDataBase(
                     title: titleController.text,
                     date: dateController.text,
                     time: timeController.text,
                   ).then((value) {

                     getDataFromDataBase(database).then((value)
                     {
                       Navigator.pop(context);

                       cubit.isBottomSheetShown=false;
                       /*cubit.ChangeBottomSheetShown(
                         isShown: false,
                         icon: Icons.edit,
                     );*/
                         cubit.fabIcon = Icons.edit;
                         cubit.tasks = value;
                         // print(tasks);



                     });
                   });*/
                 }
               }

               else {
                 scaffoldKey.currentState!.showBottomSheet(
                       (context)
                   //هنا ححط اللي حيظهر ب (showBottomSheet)
                   =>
                       Container(
                         color: Colors.white,
                         child: Padding(
                           padding: const EdgeInsets.all(20.0),
                           child: Form(
                             key: formKey,
                             child: Column(
                               mainAxisSize: MainAxisSize.min,
                               children: [
                                 defaultFormFiled(
                                   controller: titleController,
                                   type: TextInputType.datetime,

                                   validate: (value) {
                                     if (value!.isEmpty) {
                                       return 'Title Must Not Be Empty';
                                     }
                                     return null;
                                   },

                                   label: 'tasks Title',
                                   prefix: Icons.title,
                                 ),

                                 SizedBox(
                                   height: 15.0,
                                 ),

                                 defaultFormFiled(
                                   controller: timeController,
                                   onTap: () {
                                     showTimePicker(
                                       context: context,
                                       initialTime: TimeOfDay.now(),
                                     ).then((value) {
                                       timeController.text =
                                           value!.format(context).toString();
                                       print(value.format(context));
                                     });
                                     //print('Title Tapped');
                                   },
                                   type: TextInputType.datetime,
                                   // isClickable: false,
                                   validate: (value) {
                                     if (value!.isEmpty) {
                                       return 'Time Must Not Be Empty';
                                     }
                                     return null;
                                   },
                                   label: 'tasks Time',
                                   prefix: Icons.watch_later_outlined,
                                 ),


                                 SizedBox(
                                   height: 15.0,
                                 ),

                                 defaultFormFiled(
                                   controller: dateController,
                                   type: TextInputType.datetime,
                                   // isClickable: false,
                                   onTap: () {
                                     showDatePicker(
                                       context: context,
                                       initialDate: DateTime.now(),
                                       firstDate: DateTime.now(),
                                       lastDate: DateTime.parse('2022-12-30'),
                                     ).then((value) {
                                       // print(DateFormat.yMMMd().format(value!));
                                       dateController.text =
                                           DateFormat.yMMMd().format(value!);
                                       print(value.toString());
                                     });
                                     //print('Title Tapped');
                                   },

                                   validate: (value) {
                                     if (value!.isEmpty) {
                                       return 'Date Must Not Be Empty';
                                     }
                                     return null;
                                   },


                                   label: 'tasks Data',
                                   prefix: Icons.calendar_today,

                                 ),
                               ],
                             ),
                           ),
                         ),
                       ),
                   elevation: 20.0,
                 ).closed.then((value) {
                   // Navigator.pop(context);

                   cubit.ChangeBottomSheetShown(
                     isShown: false,
                     icon: Icons.edit,
                   );

                 });



                 cubit.ChangeBottomSheetShown(
                   isShown: true,
                   icon: Icons.add,
                 );

                 /*setState(() {
  fabIcon = Icons.add;
  });*/
               }

               // {زي اللي في الجافا}
               // اذا ظهر عندي ايرور (اكسبشن)
               /* try{
                  throw(' some error !!!!');
                  var name= await getname();
                  print(name);
                  // انتبه على لون الجملة اللي فوق هيك يعني مش هيتنفذ
                  //اللي بعد الثروو ما بيتنفذ
                  // حيطبع بس الكاتش (!!!! some error )
                  // بدي اعمل ايرور
                 // throw(' some error !!!!');
                  // print Ahmed Ali and some error !!!!
                }*/
               /*catch(error){
                  print('error${error.toString()}');
                }*/
               //   (في التراي والكاتش لااازم نحط async and await
               /* getname().then((value){
                      print(value);
                      print('Osama');
                      throw('أنا عملت ايرور');
                 }).catchError((error){
                   print('error${error.toString()}');
                 });*/
             },
             child: Icon(
               cubit.fabIcon,
             ),
             // );

             /*.catchError((error){
                 print('error${error.toString()}');
               });*/
             // ),


             // },
             // );


             // Icon(
             //fabIcon,
             // ),
           ),
           bottomNavigationBar: BottomNavigationBar(
               type: BottomNavigationBarType.fixed,
               currentIndex: cubit.currentIndex,
               onTap: (index) {
                 cubit.ChangeIndex(index);
               },
               items: [
                 BottomNavigationBarItem(
                     icon: Icon(
                       Icons.menu,
                     ),
                     label: 'tasks'

                 ),
                 BottomNavigationBarItem(
                   icon: Icon(
                     Icons.check_circle_outline,
                   ),
                   label: 'Done',
                 ),
                 BottomNavigationBarItem(
                   icon: Icon(
                     Icons.archive_outlined,
                   ),
                   label: 'Archived',
                 ),
               ]
           ),


         );
        },


      ),
    );
  }


  //Instance of 'Future<String>' يعني بيعطيك اوبجكت منها
  /*Future<String> getname() async {
    return 'Ahmed Ali';
  }*/


}



//1. Create DataBase
//2. Create Tables
//3. Open DataBase
//حمسك اوبجكت بايدي
//4. insert to DataBase
//5. get form  DataBase
//6. Update  in DataBase
//7. Delete from DataBase


