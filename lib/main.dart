import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/layout/news_app/cubit/cubit.dart';
import 'package:flutterapp/layout/shop_app/cubit/cubit.dart';
import 'package:flutterapp/layout/shop_app/shop_layout.dart';
import 'package:flutterapp/modules/shop_app/login/shop_login_screen.dart';
import 'package:flutterapp/modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:flutterapp/shared/blocobserver.dart';
import 'package:flutterapp/shared/components/conestant.dart';
import 'package:flutterapp/shared/cubit/cubit.dart';
import 'package:flutterapp/shared/cubit/states.dart';
import 'package:flutterapp/shared/network/local/cache_helper.dart';
import 'package:flutterapp/shared/network/remote/dio_helper.dart';
import 'package:flutterapp/shared/styles/themes.dart';


void main() async
{
   WidgetsFlutterBinding.ensureInitialized();
   Bloc.observer = MyBlocObserver();
   DioHelper();
   await ChaseHelper.init();
   print(token);

   bool? isDark= ChaseHelper.getData( key: "isDark");
   Widget widget;
   bool? onBoarding= ChaseHelper.getData( key: "onBoarding");
   token = ChaseHelper.getData( key: "token");

   if(onBoarding != null){
       if(token != null) widget = ShopLayout();
         else widget = ShopLoginScreen();
   }
   else
   {
     widget = OnBoardingScreen();
   }


   print(onBoarding);

   // bool? isDark= true;

   runApp(MyApp(
      isDark,
      widget,
   ));
}

class MyApp extends StatelessWidget{

    //bool? isDark= true;
    bool? isDark;
    Widget? startWidget;
    MyApp(
        this.isDark,
        this.startWidget
        );

  @override
  Widget build( BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create : (context) =>NewsCubit()..getBusiness()..getSports()..getscience()),
        BlocProvider(create: (BuildContext context)=> AppCubit()..changeAppMode(
          formshared: isDark,
        ),),
        BlocProvider(create : (context) => ShopCubit()..getHomeData()..getCategories()..getFavorites()..getUserData(),),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.light,
            //context.watch<AppCubit>().isDark? ThemeMode.dark : ThemeMode.light, //AppCubit.get(context).isDark? ThemeMode.dark : ThemeMode.light,

            home: startWidget,
            //حبعت الويدجت بناء على الي حغيرو فوق
          );
        },
      ),
    );

  }

}




