import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/layout/shop_app/cubit/cubit.dart';
import 'package:flutterapp/layout/shop_app/cubit/state.dart';
import 'package:flutterapp/models/shop_app/categories_model.dart';
import 'package:flutterapp/shared/components/components.dart';

class CateogriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopState>(
      listener: (context,state){},
      builder: (context,state){
        return ListView.separated(
          itemBuilder: (context,index)=> buildCatItem(ShopCubit.get(context).cateogriesModel!.data.data![index]),
          separatorBuilder: (context,index)=> myDivider(),
          itemCount: ShopCubit.get(context).cateogriesModel!.data.data!.length,
        );
      },
    );
  }

  Widget buildCatItem (DataModel model)=> Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Image(
          image: NetworkImage(model.image!),
          width: 80.0,
          height: 80.0,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          model.name!,
        ),
        Spacer(),
        Icon(
          Icons.arrow_forward_ios,
        ),


      ],


    ),
  );

}