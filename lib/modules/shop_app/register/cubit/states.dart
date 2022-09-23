
import 'package:flutterapp/models/shop_app/login_model.dart';
import 'package:flutterapp/modules/shop_app/login/cubit/states.dart';

abstract class ShopRegisterStates {}

class ShopRegisterInitialStates extends ShopRegisterStates{}

class ShopRegisterLoadingStates extends ShopRegisterStates{}

class ShopRegisterSuccessStates extends ShopRegisterStates{
  //بدي ابعت معاها عشان لما اطلع برا في شوب لوجين سكرين اعمل ليستن

  ShopLoginModel loginModel;

  ShopRegisterSuccessStates(this.loginModel);


}

class ShopRegisterErrorStates extends ShopRegisterStates{

  late final String error;
  ShopRegisterErrorStates(this.error);

}

 class ShopRegisterChangePasswordVisibilityStates extends ShopRegisterStates{}
