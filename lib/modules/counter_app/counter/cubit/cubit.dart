import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/modules/counter_app/counter/cubit/states.dart';



class CounterCubit extends Cubit<CounterStates> {

   CounterCubit() : super(CounterInitialState());

   //to more be easily when use this cubit in many place,
   static CounterCubit get(context)=>BlocProvider.of(context) ;

   int counter=1;

   //الميثود اللي حبدا شغل فيه
   void minus(){
  counter--;
  emit(CounterMinusState(counter));
  //print(counter);
 }

   void plus(){
     counter++;
     emit(CounterPlusState(counter));
     //print(counter);
   }



}