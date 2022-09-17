import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/layout/news_app/cubit/cubit.dart';
import 'package:flutterapp/layout/news_app/cubit/states.dart';
import 'package:flutterapp/shared/components/components.dart';

class BusinessScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates> (
      listener: (context,state){},
      builder: (context,state) {
        var list= NewsCubit.get(context).business;

        return articleBuilder(list,context);

      }

    );
  }
}
//https://cleantechnica.com/files/2022/08/Tesla-Model-3-small-hubcap-and-lug-nut-covers-7-clean-watermark.png