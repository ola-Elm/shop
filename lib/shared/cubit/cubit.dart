 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/modules/todo_app/archive_tasks/archive_tasks_screen.dart';
import 'package:flutterapp/modules/todo_app/done_tasks/done_tasks_screen.dart';
import 'package:flutterapp/modules/todo_app/new_tasks/new_tasks_screen.dart';
import 'package:flutterapp/shared/cubit/states.dart';
import 'package:flutterapp/shared/network/local/cache_helper.dart';
import 'package:sqflite/sqflite.dart';



class AppCubit extends Cubit<AppStates>{

  AppCubit(): super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);


  int currentIndex = 0;


  List<Widget> screens = [

    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),

  ];

  List<String> titles = [

    'New tasks',
    'Done tasks',
    'Archived tasks',

  ];


  void ChangeIndex (int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  late Database database;
  //List<Map> tasks = [];
   List<Map> newTasks=[];
   List<Map> doneTasks=[];
   List<Map> archivedTasks=[];

  void createDataBase() {
    openDatabase(
        'my_data.db',
        version: 2,
        onCreate: (database, version) async {
          print('database created');
          await database.execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT , date TEXT,time TEXT,status TEXT)')
              .then((value) {
            print('table created');
          }).catchError((error) {
            print('error When created TABLE tasks ${error!!!!!}');
          });
        },
        onOpen: (database) {

          getDataFromDataBase(database);

           print('datebase Opened ');
        },

    ).then((value) {
      database= value;
      emit(AppCreateDataBaseStates());
    });
  }

    insertDataBase({
    required String title,
    required String date,
    required String time,
  }) async {
    // ممكن يكون في (transaction) (CatchError) عادي
        await database.transaction((txn) {
      // id ==> oto increment
      //فخلص برجعش اكتبها بكتبها مرة وحدة بس
       return txn.rawInsert(
          'INSERT INTO tasks (title,date,time,status)''VALUES("$title","$date","$time","New")'
      ).then((value) {

        print('$value inserted Successfully');

        emit(AppInsertDataBaseStates());

        //getDataFromDataBase(database);
        getDataFromDataBase(database);
      }).catchError((error) {
        print('Error When Insert New Recode ${error}');
      });
    }
    );
  }


  void getDataFromDataBase(database) {
    newTasks =[];
    doneTasks =[];
    archivedTasks =[];

    //بدي اكتب جملة اجيب الداتا كلها
    //* ==> معناها كل  جميع

    emit(AppGetDataBaseLoadingStates());
      database.rawQuery('SELECT * FROM tasks').then((value) {
       // tasks=value;
       //  print(newTasks);
        value.forEach((element)
        {

          if(element['status'] == 'new')
           newTasks.add(element);

          else if (element['status'] == 'done')
            doneTasks.add(element);

          else archivedTasks.add(element);


         //print(element['status']);

  //emit(AppGetDataBaseStates());
  });
        emit(AppGetDataBaseStates());


  //لما بدي استخرج من الماب بدي استدعي الكيي
  //print(tasks);
  // print(tasks);
  // print(tasks[0]);
  // print(tasks[1]['title']);
  // print(tasks[2]['time']);
  });
  }

  void updateDate({
    required String status,
    required int id,

   })async {
        database.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id],
       ).then((value)
        {
          getDataFromDataBase(database);
         emit(AppUpdateDataBaseStates());

       });
  }




  void deleteDate({
    required int id,

  })async
  {
    database.rawDelete(
      'DELETE FROM tasks WHERE id = ?', [id],
    ).then((value)
    {
      getDataFromDataBase(database);
      emit(AppDeleteDataBaseStates());

    });
  }

  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

  void ChangeBottomSheetShown({
   required bool isShown,
    required IconData icon,
}){
    isBottomSheetShown=isShown;
    fabIcon=icon;
    emit(AppChangeBottomSheetState());
  }


    bool isDark = false;

  void changeAppMode({bool? formshared}) {
    if (formshared != null) {
      isDark = formshared;
      emit(AppChangeModeStates());
    }

    else {
      isDark = !isDark;
      ChaseHelper.putBoolean(key: 'isDark', value: isDark).then((value)
      {
        emit(AppChangeModeStates());
      });
    }
  }
}

