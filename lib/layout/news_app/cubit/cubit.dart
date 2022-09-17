import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/layout/news_app/cubit/states.dart';
import 'package:flutterapp/modules/news_app/business/business_screen.dart';
import 'package:flutterapp/modules/news_app/science/science_screen.dart';
import 'package:flutterapp/modules/news_app/sports/sport_screen.dart';
import 'package:flutterapp/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex= 0;

   List<BottomNavigationBarItem> bottomItems = [

     const BottomNavigationBarItem(
         icon: Icon(
           Icons.business,
         ),
         label: 'Business',

      ),
     const BottomNavigationBarItem(
       icon: Icon(
         Icons.sports,
       ),
       label: 'Sports',

     ),
     const BottomNavigationBarItem(
       icon: Icon(
         Icons.science,
       ),
       label: 'Science',

     ),


     //BottomNavigationBarItem(
     //        icon: Icon(
     //          Icons.settings,
     //        ),
     //        label: 'Setting',
     //
     //      ),


   ];

   List<Widget> screens =[
     BusinessScreen(),
     SportScreen(),
     ScienceScreen(),
   //  SettingScreen(),


   ];



   void changeBottomNavBar(int index){
     currentIndex= index ;
     if(index==1){
           getSports();
     }
     if(index==2){
       getscience();
     }

     emit(NewsBottomNavState());
    }

    List<dynamic> business=[];

    void getBusiness(){
     emit(NewsGetBusinessLoadingState());
     DioHelper().getData(
       url: 'v2/top-headlines',
       //url: 'energyskeptic.com/2022/why-how-mining-metals-for-renewables-will-destroy-the-planet-not-prevent-the-energy-crisis',
       query:
       {
         'country' : 'us',
         'category' : 'business',
        // 'apiKey' : '96e1b3a6cc3b4725b3d0de2e7af6ed9a',

       },
     ).then((value)
     {
      // print(value.data['articles'][0]['title']);
       business = value.data['articles'];
       print(business[0]['title']);

       emit(NewsGetBusinessSuccessState());

     }).catchError( (error){
       print(error.toString());
       emit(NewsGetBusinessErrorState(error.toString()));
     });
   }


    List<dynamic> sports=[];

    void getSports(){
    emit(NewsGetSportsLoadingState());

    if(sports.length == 0){
      DioHelper ().getData(
        url: 'v2/top-headlines',
        query:
        {
          'country' : 'eg',
          'category' : 'sports',
          //'apiKey' : 'API_KEY',

        },
      ).then((value)
      {
        // print(value.data['articles'][0]['title']);
        sports = value.data['articles'];
        print(sports[0]['title']);

        emit(NewsGetSportsSuccessState());

      }).catchError( (error){
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    }
    else  emit(NewsGetSportsSuccessState());


  }



   List<dynamic> science=[];

    void getscience(){
    emit(NewsGetScienceLoadingState());
    if(science.length == 0){
      DioHelper ().getData(
        url: 'v2/top-headlines',
        query:
        {
          'country' : 'eg',
          'category' : 'science',
     //     'apiKey' : 'API_KEY',

        },
      ).then((value)
      {
        // print(value.data['articles'][0]['title']);
        science = value.data['articles'];
        print(science[0]['title']);

        emit(NewsGetScienceSuccessState());

      }).catchError( (error){
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    }
       else   emit(NewsGetScienceSuccessState());


  }

  List<dynamic> search=[];

  void getSearch(String value){
    emit(NewsGetScienceLoadingState());
    search=[];

    {
      DioHelper ().getData(
        url: 'v2/everything',
        query:
        {

          'q' : '$value',
       //   'apiKey' : 'API_KEY',

        },
      ).then((value)
      {
        // print(value.data['articles'][0]['title']);
        search = value.data['articles'];
        print('---------------------- ${search[0]['title']}');

        emit(NewsGetSearchSuccessState());

      }).catchError( (error){
        print('-------------------------error.toString()');
        emit(NewsGetScienceErrorState(error.toString()));
      });
    }


  }


}