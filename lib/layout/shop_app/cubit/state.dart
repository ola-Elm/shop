import 'package:flutterapp/layout/shop_app/cubit/state.dart';
import 'package:flutterapp/models/shop_app/change_favorite_model.dart';
import 'package:flutterapp/models/shop_app/login_model.dart';

abstract class ShopState{}

class ShopAppInitialState extends ShopState{}

class ShopChangeBottomNavState  extends ShopState{}

class ShopLoadingHomeDataState extends ShopState{}

class ShopSuccessHomeDataState extends ShopState{}

class ShopErrorHomeDataState extends ShopState{}

class ShopSuccessCategoriesState extends ShopState{}

class ShopErrorCategoriesState extends ShopState{}

class ShopSuccessFavoritesChangeState extends ShopState
{

   final ChangeFavoriteModel model;

  ShopSuccessFavoritesChangeState(this.model);
}

class ShopErrorFavoritesChangeState extends ShopState{}

class ShopChangeFavoritesState extends ShopState{}

class ShopSuccessGetFavoritesState extends ShopState{}

class ShopLoadingGetFavoritesState extends ShopState{}

class ShopErrorGetFavoritesState extends ShopState{}

class ShopSuccessUserDataState extends ShopState
{
  final ShopLoginModel loginModel;

  ShopSuccessUserDataState(this.loginModel);
}

class ShopLoadingUserDataState extends ShopState{}

class ShopErrorUserDataState extends ShopState{}



