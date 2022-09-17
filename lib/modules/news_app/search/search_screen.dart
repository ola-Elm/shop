import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/layout/news_app/cubit/cubit.dart';
import 'package:flutterapp/layout/news_app/cubit/states.dart';
import 'package:flutterapp/shared/components/components.dart';

class SearchScreen extends StatelessWidget {

var searchController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
      var list=NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),

          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormFiled(
                  controller: searchController,
                  type: TextInputType.text,
                  onSubmit:  (value){
                    debugPrint(value);
                    NewsCubit.get(context).getSearch(value);


                  },
                  onChang: (value){
                    debugPrint(value);

                    NewsCubit.get(context).search;
                  },

                  //مع كل تشينج حروح اعمل سيرش
                  //بدي ابعتلو فاليوو
                  validate: (value)
                  {
                    if(value!=null && value.isEmpty){
                      return 'Search must not empty';
                    }
                    return null;
                  },
                  label: 'Search',
                  prefix: Icons.search,

                ),
              ),
              Expanded(
                  child: articleBuilder(list, context,isSearch: true,),)




            ],
          ),



        );

      },

    );
  }
}
