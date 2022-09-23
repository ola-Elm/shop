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
  Map<int , bool> favorites = {};
   void getHomeData()
   {
     // emit(ShopLoadingHomeDataState());

     DioHelper().getData(
        url: HOME,
        token: token,
      ).then((value){
        print('---------- ${value.statusCode}');
        homeModel = HomeModel.fromJson(value.data);
        print('---------- ${homeModel!.data!.product}');
        //printFullText(homeModel!.data!.banner[0].image);
        // printFullText(homeModel.toString());
        print(homeModel?.status);

        homeModel!.data!.product.forEach((element)
        {
          favorites.addAll({
               element.id as int: element.inFavorites!,
          });
        });

        print(favorites.toString());



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

   ChangeFavoriteModel? changeFavoriteModel;

   void changeFavorites(int productId)
  {
    favorites[productId] = !favorites[productId]!;//القيمة وعكسها
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

       if(!changeFavoriteModel!.status!){

         favorites[productId] = !favorites[productId]!;

       } else
       {
         getFavorites();
       }
       emit(ShopSuccessFavoritesChangeState(changeFavoriteModel!));

     }).catchError((error){
       favorites[productId] = !favorites[productId]!;
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


  void updateUserData({
    required String? name,
    required String? email,
    required String? phone,
})
  {
    emit(ShopLoadingUserDataState());
    DioHelper().putData(
      url: UPDATE_PROFILE,
      token: token,
      data:
      {
        'name':name,
        'email':email,
        'phone':phone,
      },
    ).then((value){
      userModel = ShopLoginModel.fromJson(value.data);
      // printFullText(userData!.data!.name);
      emit(ShopSuccessUpdateState(userModel!));

    }).catchError((error){
      print(error.toString());
      emit(ShopErrorUpdateState());
    });
  }


}