import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/layout/shop_app/cubit/cubit.dart';
import 'package:flutterapp/layout/shop_app/cubit/state.dart';
import 'package:flutterapp/modules/shop_app/search/search_screen.dart';
import 'package:flutterapp/shared/components/components.dart';

class ShopLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ShopCubit,ShopState>(
      listener: (context,state){},
      builder: (context,state)
      {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Salla',
            ),
            actions: [
              IconButton(
                  onPressed: ()
                  {
                    navigateTo(context, SearchScreen());
                  },
                  icon: Icon(
                      Icons.search,
                    color: Colors.black,
                  ),
              ),
            ],
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index){
                cubit.changeBottom(index);
              },
                currentIndex: cubit.currentIndex,
                items:
                const [
                  BottomNavigationBarItem(
                     icon: Icon(Icons.home),
                   label: 'Home',

                 ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.apps),
                    label: 'Cateogries',


                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    label: 'Favorite',


                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Settings',


                  ),



            ]),




        );


      },

    );
  }
}
// TextButton(
// onPressed: (){
//
// },
// child: Padding(
// padding: const EdgeInsets.all(20.0),
// child: Text('SIGN OUT',),
//
// ),
// ),