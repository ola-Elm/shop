import 'package:flutterapp/models/shop_app/login_model.dart';

abstract class ShopLoginStates {}

class ShopLoginInitialStates extends ShopLoginStates{}

class ShopLoginLoadingStates extends ShopLoginStates{}

class ShopLoginSuccessStates extends ShopLoginStates{
  //بدي ابعت معاها عشان لما اطلع برا في شوب لوجين سكرين اعمل ليستن

  ShopLoginModel loginModel;

  ShopLoginSuccessStates(this.loginModel);


}

class ShopLoginErrorStates extends ShopLoginStates{

  late final String error;
  ShopLoginErrorStates(this.error);

}

class ShopChangePasswordVisibilityStates extends ShopLoginStates{}
