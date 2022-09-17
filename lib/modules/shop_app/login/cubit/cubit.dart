import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/modules/shop_app/login/cubit/states.dart';
import 'package:flutterapp/shared/network/end_points.dart';
import 'package:flutterapp/shared/network/remote/dio_helper.dart';
import 'package:flutterapp/models/shop_app/login_model.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {

  ShopLoginCubit() : super(ShopLoginInitialStates());


  //object

  static ShopLoginCubit get(context) => BlocProvider.of(context);
  int currentState= 0;

  late ShopLoginModel loginModel;

   void userLogin({
    required String? email,
    required String? password,
  })
  {
    emit(ShopLoginLoadingStates());
    //DioHelper().init();
      DioHelper().postData(

      //url=> indipoint
      url: 'login',
      //(data)محتاجة=> (key:value)
      //email:' ' & password" '',
      data: {
        //عشان بدي استدعي الميثود برا حعمل ريكوايرد للميثود ومش ححط الايميل والباسوورد بايدي
        'email': email,
        'password': password,
      },
      ).then((value) {
        //انا هنا عملت المودل بايدي
        loginModel=ShopLoginModel.fromJson(value.data);
        //هيك بكون جاهز اخد منو اوبشنت
        print(loginModel?.status);
        print(loginModel?.massage);
        print(loginModel?.data?.token);
        // print(value.data);
        // print(value.data['message']);
        emit(ShopLoginSuccessStates(loginModel));
    }).catchError((error){
      print(error.toString());
      emit(ShopLoginErrorStates(error.toString()));
    }) ;
  }

   IconData suffix=Icons.visibility_outlined;
   bool isPassword = true;

   void ChangePasswordVisibility(){
     isPassword= !isPassword;

     suffix=isPassword?  Icons.visibility_off_outlined : Icons.visibility_outlined;

     emit(ShopChangePasswordVisibilityStates());
   }
}







