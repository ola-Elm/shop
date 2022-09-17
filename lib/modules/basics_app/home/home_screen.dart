import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
       // backgroundColor: Colors.blue,

        leading: Icon(
          Icons.menu,
        ),
        title: Text(
          'First App',
        ),
        actions: [
          IconButton(
            icon: Icon(

              Icons.notification_important,
      ),
            onPressed: (){
              print('Notification');
            },
          ),
          IconButton(
             icon: Icon(
               Icons.search,
             ),
           onPressed: (){
              print('Hello');
           },
         )
        ],

        //centerTitle: true,
        //elevation: 10.0,


      ),
      body:Container(
          color: Colors.black38,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              color: Colors.redAccent,
              child: Text(
               'First',
                style: TextStyle(
                //  backgroundColor: Colors.red,
                  color: Colors.brown,
                  fontSize: 20.0,
                ),
              ),
            ),
            Container(
              color: Colors.brown,
              child: Text(
                'Second',
                style: TextStyle(
                  //backgroundColor: Colors.green,
                  color: Colors.teal,
                  fontSize: 20.0,
              ),
              ),
            ),
            Container(
              color: Colors.grey,
              child: Text(
                'Third' ,
                 style: TextStyle(
                   //backgroundColor: Colors.grey,
                 color: Colors.green,
                 fontSize: 20.0,
              ),
              ),
            ),
            Container(
              color: Colors.teal,
              child: Text(
                'Four',
                style: TextStyle(
                  color: Colors.red,
                 // backgroundColor: Colors.black,
                  fontSize: 20.0,
                ),
              ),
            ),

          ],
        ),
      ),


    );
  }

}