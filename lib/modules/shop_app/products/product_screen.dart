import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/layout/shop_app/cubit/cubit.dart';
import 'package:flutterapp/layout/shop_app/cubit/state.dart';
import 'package:flutterapp/models/shop_app/categories_model.dart';
import 'package:flutterapp/models/shop_app/home_model.dart';
import 'package:flutterapp/shared/components/components.dart';
import 'package:flutterapp/shared/styles/colors.dart';

class ProductScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     return BlocConsumer<ShopCubit,ShopState>(
      listener: (context,state)
      {
        if(state is ShopSuccessFavoritesChangeState){
          if(state.model.status!){//==> state=false
                  showToast(
                    text: state.model.message!,
                    state: ToastStates.ERROR,
                  );
          }
        }
      },
       builder: (context,state)
       {
        return ConditionalBuilder(
          condition: ShopCubit.get(context).homeModel != null && ShopCubit.get(context).cateogriesModel != null,
          builder: (context) => productsBuilder(ShopCubit.get(context).homeModel!, ShopCubit.get(context).cateogriesModel! , context),
          fallback: (context)=> const Center(child: CircularProgressIndicator()),
        );
       },
      );
  }

  Widget productsBuilder(HomeModel model, CategoriesModel categoriesModel, context) => SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
      [
         CarouselSlider(
             items: model.data!.banner.map<Widget>((element) =>
                 Image(
               image: NetworkImage('${element.image}'),
               width: double.infinity,
               fit: BoxFit.cover,
             ),
             ).toList(),
             options: CarouselOptions(
               height: 250.0,
               initialPage: 0,//حبدا من اول وحدة
               viewportFraction: 1.0,// كم صورة تظهر في شاشة العرض
               enableInfiniteScroll: true,// يعني حيضل يلف حولين نفسه على طوول
               reverse: false,// ما يقلب الصور اللي ححطهن بالسكرين
               autoPlay: true,
               autoPlayInterval: const Duration(seconds: 3,),//حيعد 3 ثواني ويقلب ويغير
               autoPlayAnimationDuration: const Duration(seconds: 1),//يقلب ما بين الصور
               autoPlayCurve: Curves.fastOutSlowIn,//شكلها
               scrollDirection: Axis.horizontal,
             ),
         ),
         const SizedBox(
          height: 10.0,
        ),
         Padding(
           padding: const EdgeInsets.symmetric(
               horizontal: 10.0,
           ),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(
                 'Categories',
                   style: TextStyle(
                     fontSize: 24.0,
                     fontWeight: FontWeight.w800,
                   ),
               ),
               const SizedBox(
                 height: 10.0,
               ),
               Container(
                 height: 100.0,
                 child: ListView.separated(
                   physics: BouncingScrollPhysics(),
                   scrollDirection: Axis.horizontal,
                   itemBuilder: (context, index)=> buildCategoriesItem(categoriesModel.data.data![index], context),
                   separatorBuilder: (context, index)=>SizedBox(
                     width: 10.0,
                   ),
                   itemCount: categoriesModel.data.data!.length,
                 ),
               ),
               const SizedBox(
                 height: 20.0,
               ),
               Text(
                'New Product',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w800,
                ),
        ),
             ],
           ),
         ),
         Container(
           color: Colors.grey[300],
           child: GridView.count(
             shrinkWrap: true,
             physics: const NeverScrollableScrollPhysics(),
             crossAxisCount: 2,
             mainAxisSpacing: 1.0,
             crossAxisSpacing: 1.0,
             childAspectRatio: 1/1.58, // بتحكم في الطول والعرض
             children: List.generate(
                 model.data!.product.length,
                   (index) => buildGridProduct(model.data!.product[index], context),
    ),
           ),
         ),
      ],
    ),
  );

  Widget buildCategoriesItem(DataModel model, context)=> Stack(
    alignment: AlignmentDirectional.bottomCenter,
    children:
    [
        Image(
        image: NetworkImage(model.image!),
        width: 100.0,
        height: 100.0,
        fit: BoxFit.cover,
      ),
      Container(
        width: 100.0,
        color: Colors.black.withOpacity(.8,),
        child: Text(
           model.name!,
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    ],
  );

  Widget buildGridProduct(ProductModel model, context) => Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(
              image: NetworkImage(model.image[0]),
              height: 200.0,
              width: double.infinity,
            ),
            if(model.discount != 0)
              Container(
              color: Colors.red,
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: const Text(
                'DISCOUNT',
                style: TextStyle(
                  fontSize: 8.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14.0,
                  height: 1.3,
                ),
              ),
              Row(
                children:
                [
                  Text(
                    model.price.round().toString(),
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: defaultColor,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  if(model.discount != 0)
                  Text(
                      model.oldPrice.round().toString(),
                      style: const TextStyle(
                        fontSize: 10.0,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  const Spacer(),
                  IconButton(
                      onPressed: ()
                      {
                        ShopCubit.get(context).changeFavoriteModel;
                        print(model.id);

                      },
                      icon: const CircleAvatar(
                        radius: 15.0,
                        // backgroundColor: ShopCubit.get(context).favorite[model.id] ? defaultColor : Colors.grey,
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

    ),
  );

}