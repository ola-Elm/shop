import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/layout/shop_app/cubit/cubit.dart';
import 'package:flutterapp/modules/shop_app/search/cubit/cubit.dart';
import 'package:flutterapp/modules/shop_app/search/cubit/state.dart';
import 'package:flutterapp/shared/components/components.dart';

class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var formkey = GlobalKey<FormState>();
    var searchController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => SearchCubit(),
      child: BlocConsumer<SearchCubit,SearchState>(
        listener: (context,state){},
        builder: (context,state)
        {
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children:
                  [
                    defaultFormFiled(
                      controller: searchController,
                      type: TextInputType.text,
                      validate: (value)
                      {
                        if(value!.isEmpty){
                          return 'enter text to search';
                        }
                        return null ;
                      },
                      onSubmit: (String text)
                      {

                         SearchCubit.get(context).searh(text);

                      },
                      label: 'Search',
                      prefix: Icons.search,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    if(state is SearchLoadingState)
                    LinearProgressIndicator(),
                    SizedBox(
                      height: 10.0,
                    ),
                    if(state is SearchSuccessState)
                    ListView.separated(
                      itemBuilder: (context, index) =>
                          buildListProduct(SearchCubit.get(context).model!.data!.data![index], context, isOLdPrice: false),
                      separatorBuilder: (context, index) => myDivider(),
                      itemCount: SearchCubit.get(context).model!.data!.data!.length,
                    ),



                  ],
                ),
              ),
            ),


          );
        },
      ),
    );

  }
}
