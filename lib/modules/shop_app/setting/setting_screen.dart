import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/layout/shop_app/cubit/cubit.dart';
import 'package:flutterapp/layout/shop_app/cubit/state.dart';
import 'package:flutterapp/shared/components/components.dart';
import 'package:flutterapp/shared/components/conestant.dart';

class SettingScreen extends StatelessWidget {

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopState>(
      listener: (context, state)
      {
        // if(state is ShopSuccessUserDataState)
        // {
        //
        //   print(state.loginModel.data!.name);
        //   print(state.loginModel.data!.email);
        //   print(state.loginModel.data!.phone);
        //
        //    nameController.text = state.loginModel.data!.name;
        //    emailController.text = state.loginModel.data!.email;
        //    phoneController.text = state.loginModel.data!.phone;
        //
        // }
      },
      builder: (context, state){

        var model = ShopCubit.get(context).userModel;

        nameController.text = model!.data!.name;
        emailController.text = model.data!.email;
        phoneController.text = model.data!.phone;


        return ConditionalBuilder(
          condition: ShopCubit.get(context).userModel != null,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                defaultFormFiled(
                  controller: nameController,
                  type:  TextInputType.name,
                  validate: (value)
                  {
                    if(value!.isEmpty){
                      print('name must not empty');
                    }
                    return null;
                  },
                  label: 'Name',
                  prefix: Icons.person,
                ),
                SizedBox(
                  height: 20.0,
                ),
                defaultFormFiled(
                  controller: emailController,
                  type:  TextInputType.emailAddress,
                  validate: (value)
                  {
                    if(value!.isEmpty){
                      print('email must not empty');
                    }
                    return null;
                  },
                  label: 'Email Address',
                  prefix: Icons.email,
                ),
                SizedBox(
                  height: 20.0,
                ),

                defaultFormFiled(
                  controller: phoneController,
                  type:  TextInputType.phone,
                  validate: (value)
                  {
                    if(value!.isEmpty){
                      print('phone must not empty');
                    }
                    return null;
                  },
                  label: 'Phone',
                  prefix: Icons.phone,
                ),


                SizedBox(
                  height: 20.0,
                ),
                defaultButton(
                    function: ()
                    {
                      SignOut(context);
                    },
                    text: 'Logout',
                ),

              ],
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator(),),
        );
    },

    );
  }
}
