 import 'package:flutterapp/modules/shop_app/login/shop_login_screen.dart';
import 'package:flutterapp/shared/components/components.dart';
import 'package:flutterapp/shared/network/local/cache_helper.dart';

 void SignOut(context){

   ChaseHelper.removeData(key: 'token',).then((value){
     if(value!){
       navigateAndFinish(
         context,
         ShopLoginScreen(),
       );
     }},
   );

 }


 //(PrintFullText)=>  ميثود جاهزة من النت
 void printFullText(String text) {
   final RegExp pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
   pattern.allMatches(text).forEach((RegExpMatch match) =>   print(match.group(0)));
 }


  String? token = '';
