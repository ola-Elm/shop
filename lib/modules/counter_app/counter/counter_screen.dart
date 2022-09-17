import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/modules/counter_app/counter/cubit/cubit.dart';
import 'package:flutterapp/modules/counter_app/counter/cubit/states.dart';


class CounterScreen extends StatelessWidget {

 // int counter= 1;

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit,CounterStates>(
         listener: (BuildContext context,CounterStates state)
         {
          //if(state is CounterInitialState) print('initial state');
          if(state is CounterPlusState)  {
             //print('plus state ${state.counter}');
          }
          if(state is CounterMinusState) {
             //حبعت داتا مع الستيت في جملة الطباعة-
            //print('minus state  ${state.counter}');
          }
         },
         builder: (context,state){
           return  Scaffold(
             appBar: AppBar(
               title: Text(
                 'Counter',
                 style: TextStyle(
                   fontSize: 25.0,
                   fontWeight: FontWeight.w900,
                   color: Colors.white,
                 ),


               ),

             ),
             body:Center(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   TextButton(
                     onPressed: (){
                       CounterCubit.get(context).minus();

                     },
                     child: Text(
                       'MINUS',
                       style: TextStyle(
                         fontSize: 25.0,

                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.symmetric(
                       horizontal: 20.0,
                     ),
                     child: Text(
                       '${CounterCubit.get(context).counter}',
                       style: TextStyle(
                         fontSize: 60.0,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ),
                   TextButton(
                     onPressed: (){
                           CounterCubit.get(context).plus();
                      /*  setState(() {
                      counter++;
                      print(counter); });*/
                     },

                     child: Text(
                       'PLUS',
                       style: TextStyle(
                         fontSize: 25.0,

                       ),
                     ),
                   ),
                 ],
               ),
             ),

           );
         },
      ),
    );
  }
}


































//int counter=1;
/*
Scaffold(
appBar: AppBar(
title: Text(
'Counter',
style: TextStyle(
fontSize: 25.0,
fontWeight: FontWeight.w900,
color: Colors.white,
),


),

),
body:Center(
child: Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
TextButton(
onPressed: (){
counter++;
print(counter);
},
child: Text(
'MINUS',
style: TextStyle(
fontSize: 25.0,

),
),
),
Padding(
padding: const EdgeInsets.symmetric(
horizontal: 20.0,
),
child: Text(
'$counter',
style: TextStyle(
fontSize: 60.0,
fontWeight: FontWeight.bold,
),
),
),
TextButton(
onPressed: (){
counter--;
print(counter);
/*  setState(() {
                      counter++;
                      print(counter); });*/
},

child: Text(
'PLUS',
style: TextStyle(
fontSize: 25.0,

),
),
),
],
),
),

),*/


