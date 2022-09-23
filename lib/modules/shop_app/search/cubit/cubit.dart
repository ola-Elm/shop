import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/layout/shop_app/cubit/cubit.dart';
import 'package:flutterapp/layout/shop_app/cubit/state.dart';
import 'package:flutterapp/models/shop_app/search_model.dart';
import 'package:flutterapp/modules/shop_app/search/cubit/state.dart';
import 'package:flutterapp/shared/components/conestant.dart';
import 'package:flutterapp/shared/network/end_points.dart';
import 'package:flutterapp/shared/network/remote/dio_helper.dart';

class SearchCubit extends Cubit<SearchState>
{
  SearchCubit(): super(SearchInitializeState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? model;

  void searh(String text)
  {
    emit(SearchLoadingState());
   DioHelper().postData(
       url: SEARCH,
       token: token,
       data:
       {
         'text': text ,
       },
   ).then((value) {
     model = SearchModel.fromJson(value.data);
     emit(SearchSuccessState());

   }).catchError((error)
   {
     print(error.toString());
     emit(SearchErrorState());
   });
  }


}