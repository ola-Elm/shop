/*import 'package:flutter/material.dart';
import 'package:flutterapp/modules/archive_tasks/archive_tasks_screen.dart';
import 'package:flutterapp/modules/done_tasks/done_tasks_screen.dart';
import 'package:flutterapp/modules/n_tasks/n_tasks_screen.dart';
import 'package:sqflite/sqflite.dart';

class homScreen extends StatefulWidget {

  @override
  State<homScreen> createState() => _homScreenState();
}

class _homScreenState extends State<homScreen> {
 int currentIndex=0;
  List<Widget> screen=[
    NTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];

  List<String> titles=[
    'New Task',
    'Done Task',
     'Archive Task',
  ];


    @override
  void initState(){
     super.initState();
      CreatDatabase();
  }


    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            titles[currentIndex],
        ),
              ),
      body: screen[currentIndex],
      floatingActionButton: FloatingActionButton(

        //background==> { async && await }
        onPressed: () {
          /*try{
            throw 'some error !!!!' ;
            var name= await getname();
            print(name);

          }catch(error){
            print('error ${error.toString()}');
          }*/
          //Handel  Exeption
          getname().then((value) {
            print(value);
            print('Osama');
            throw 'انا عملت ايرور';
          }).catchError((error) {
            print('error ${error.toString()}');
          });
        },


        child: Icon(
          Icons.add,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
           setState((){
             currentIndex=index;
           });
        },
        items: [
          BottomNavigationBarItem(
             icon:Icon(
                Icons.menu,
              ),
             label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon:Icon(
              Icons.check_circle_outline,
            ),
            label: 'Done',
          ),
          BottomNavigationBarItem(
            icon:Icon(
              Icons.archive,
            ),
            label: 'Archived',
          ),
        ],
      ),
    );
  }

  //Instance of 'Future<String>'
  // هنا بيعطيني اوبجكت من {'Future<String>'} بس انا ما بدي ايها
  //  بدي {String} بس
  Future<String> getname() async{
    return 'Ahmed Ali';
  }


  void CreatDatabase() async
  {
   Database database = await openDatabase(
     'Todo.db',
     version: 1,

     onCreate:(Database database,int version)   async
     {
       print('database Created');
       //طالما بترجع{Futuer} اذن حنحطلها {await}
       //اللي بنكتب جوا{execute} هو صحيح عبارة عن {String} بس بيقراها البرنامج
       // اسم {TABLE}==> {tasks}
         await database.execute(
           'Created table tasks (id INTEGER PRIMARY KEY ,title TEXT , date TEXT , time TEXT , status TEXT )')
           .then((value) {
         print('table Created');
       }).catchError((error){
         print('Error When Created table ${error.toString()}');
       }) ;
     },
     onOpen:(database){
       print('database Opened');
     },
   );


  }

  void InsertDataBase(){




  }





}*/
