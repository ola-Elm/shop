import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/layout/shop_app/cubit/state.dart';
import 'package:flutterapp/models/shop_app/categories_model.dart';
import 'package:flutterapp/models/shop_app/change_favorite_model.dart';
import 'package:flutterapp/models/shop_app/favorites_model.dart';
import 'package:flutterapp/models/shop_app/home_model.dart';
import 'package:flutterapp/models/shop_app/login_model.dart';
import 'package:flutterapp/modules/shop_app/cateogries/cateogries.dart';
import 'package:flutterapp/modules/shop_app/favorits/favorit_screen.dart';
import 'package:flutterapp/modules/shop_app/products/product_screen.dart';
import 'package:flutterapp/modules/shop_app/setting/setting_screen.dart';
import 'package:flutterapp/shared/components/conestant.dart';
import 'package:flutterapp/shared/network/end_points.dart';
import 'package:flutterapp/shared/network/remote/dio_helper.dart';

class ShopCubit extends Cubit<ShopState>{
  ShopCubit(): super(ShopAppInitialState());


  static ShopCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> bottomScreens =
  [
    ProductScreen(),
    CateogriesScreen(),
    FavoriteScreen(),
    SettingScreen(),

  ];

  void changeBottom(int index)
  {
     currentIndex = index;
     emit(ShopChangeBottomNavState());

   }

  HomeModel? homeModel;
  Map<int , bool> favorite = {};
   void getHomeData()
   {
     // emit(ShopLoadingHomeDataState());

     DioHelper().getData(
        url: HOME,
        token: token,
      ).then((value){

        homeModel = HomeModel.fromJson(value.data);
        homeModel!.data!.product;
        //printFullText(homeModel!.data!.banner[0].image);
        // printFullText(homeModel.toString());
        print(homeModel?.status);

        homeModel!.data!.product.forEach((element)
        {
          favorite.addAll({
               element.id: element.inFavorites!,
          });
        });




        // print(homeModel.toString());
        emit(ShopSuccessHomeDataState());
      }).catchError((error){
        print(error.toString());
         emit(ShopErrorHomeDataState());
      });

      // emit(ShopLoadingHomeDataState());

   }

  CategoriesModel? cateogriesModel;
   void getCategories()
   {

    DioHelper().getData(
      url: GET_CATEGORIES,
      token: token,
    ).then((value){
      cateogriesModel = CategoriesModel.fromJson(value.data);
      emit(ShopSuccessCategoriesState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorCategoriesState());
    });
  }

  //FAVORITES

  late ChangeFavoriteModel changeFavoriteModel;

   void changeFavorites(int productId)
  {
    favorite[productId] = !favorite[productId]!;//القيمة وعكسها
    // emit(ShopSuccessFavoritesChangeState());

     DioHelper().postData(
       url: FAVORITES,
       data:
       {
         'product_id': 'productId',
       },
       token: token,
     ).then((value)
     {
       //ححط القيمة تاعتي
       changeFavoriteModel= ChangeFavoriteModel.fromJson(value.data);
      // print(value.data);
       emit(ShopChangeFavoritesState());

       if(!changeFavoriteModel.status!){

       favorite[productId] = !favorite[productId]!;

       } else
       {
         getFavorites();
       }
       emit(ShopSuccessFavoritesChangeState(changeFavoriteModel));

     }).catchError((error){
        favorite[productId] = !favorite[productId]!;
       emit(ShopErrorFavoritesChangeState());
     });


  }


  FavoritesModel? favoritesModel;
  void getFavorites()
  {
    emit(ShopLoadingGetFavoritesState());
    DioHelper().getData(
      url: FAVORITES,
      token: token,
    ).then((value){
      favoritesModel = FavoritesModel.fromJson(value.data);
      //printFullText(value.data.toString());
      emit(ShopSuccessGetFavoritesState());
    }).catchError((error){
      print(error.toString());
      emit(ShopErrorGetFavoritesState());
    });
  }


   ShopLoginModel? userModel;
  void getUserData()
  {
    emit(ShopLoadingUserDataState());
    DioHelper().getData(
      url: PROFILE,
      token: token,
    ).then((value){
      userModel = ShopLoginModel.fromJson(value.data);
     // printFullText(userData!.data!.name);
      emit(ShopSuccessUserDataState(userModel!));

    }).catchError((error){
      print(error.toString());
      emit(ShopErrorUserDataState());
    });
  }

}