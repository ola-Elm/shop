import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           appBar: AppBar(
             backgroundColor: Colors.white,
             elevation: 0.0,
             titleSpacing: 20.0,
             title: Row(
               children: [
                 CircleAvatar(
                   backgroundImage: NetworkImage(''),
                   backgroundColor: Colors.blue,
                   radius: 15.0,
                 ),
                 Text(
                     'Chats',
                   style: TextStyle(
                     color: Colors.black,
                     fontSize: 20.0,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
               ],
             ),
             actions: [
               Container(
                 color: Colors.blue,
                 child: IconButton(

                     icon:Icon(
                       Icons.camera_alt,
                       color: Colors.white,
                     ),
                     onPressed: (){},
                 ),
               ),
               IconButton(
                 icon:Icon(
                   Icons.edit,
                   color: Colors.black,
                 ),
                 onPressed: (){},
               ),
             ],

           ),
    );

  }

}

