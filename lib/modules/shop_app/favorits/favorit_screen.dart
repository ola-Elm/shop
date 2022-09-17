import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/layout/shop_app/cubit/cubit.dart';
import 'package:flutterapp/layout/shop_app/cubit/state.dart';
import 'package:flutterapp/models/shop_app/favorites_model.dart';
import 'package:flutterapp/shared/components/components.dart';
import 'package:flutterapp/shared/styles/colors.dart';

class FavoriteScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopState>(
      listener: (context,state){},
      builder: (context,state){
        return ConditionalBuilder(
            condition: state is! ShopLoadingGetFavoritesState,
            builder: (context)=> ListView.separated(
              itemBuilder: (context,index)=> buildFavItem(ShopCubit().favoritesModel!.data!.data![index],context),
              separatorBuilder: (context,index)=> myDivider(),
              itemCount: ShopCubit().favoritesModel!.data!.data!.length,
            ),
            fallback:(context)=> Center( child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget buildFavItem(FavoriteData model, context) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
          height: 120.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage(model.product!.image!),
                    height: 120.0,
                    width: 120.0,
                  ),
                  if(model.product!.discount != 0)
                    Container(
                      color: Colors.red,
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child:  Text(
                        'DISCOUNT',
                        style: TextStyle(
                          fontSize: 8.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.product!.name!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:  TextStyle(
                        fontSize: 14.0,
                        height: 1.3,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children:
                      [
                        Text(
                         model.product!.price.toString(),
                          style:  TextStyle(
                            fontSize: 12.0,
                            color: defaultColor,
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        if(model.product!.discount != 0)
                          Text(
                            model.product!.oldPrice.toString(),
                            style:  TextStyle(
                              fontSize: 10.0,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        Spacer(),
                        IconButton(
                          onPressed: ()
                          {
                             ShopCubit.get(context).changeFavorites(model.product!.id!);
                            // print(model.id);

                          },
                          icon:  CircleAvatar(
                            radius: 15.0,
                            backgroundColor:
                             //id product
                             ShopCubit.get(context).favorite[model.product!.id]!
                                ? defaultColor
                                : Colors.grey,
                            child: Icon(
                              Icons.favorite_border,
                              size: 14.0,
                              color: Colors.white,
                            ),
                          ),

                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ],

          )));

}
