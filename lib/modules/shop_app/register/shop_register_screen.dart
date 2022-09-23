import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/layout/shop_app/shop_layout.dart';
import 'package:flutterapp/modules/shop_app/register/cubit/cubit.dart';
import 'package:flutterapp/modules/shop_app/register/cubit/states.dart';
import 'package:flutterapp/shared/components/components.dart';
import 'package:flutterapp/shared/components/conestant.dart';
import 'package:flutterapp/shared/network/local/cache_helper.dart';


class ShopRegisterScreen extends StatelessWidget {
  var formkey= GlobalKey<FormState>();
  var emailController=TextEditingController();
  var nameController=TextEditingController();
  var phoneController=TextEditingController();
  var passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit,ShopRegisterStates>(
        listener: (context,state)
        {
          if(state is ShopRegisterSuccessStates){
            if(state.loginModel.status!){
              showToast(
                text: state.loginModel.massage!,
                state: ToastStates.SUCCESS,
              );
              print(state.loginModel.massage);
              // print('----------- ${state.loginModel.massage}');
              print('----------- ${state.loginModel.data!.token}');
              //روح على سكرينة الهوووم
              ChaseHelper.saveData(
                key: 'token',
                value: state.loginModel.data!.token,
              ).then((value){
                token = state.loginModel.data!.token;
                 navigateAndFinish(
                     context,
                     ShopLayout(),
                 );
              });
            } else {
              //هنا===>>>> اثبت مكانك و غير واظهرلو على السكرينة
              //////////////
              print(state.loginModel.massage);
              showToast(
                text: state.loginModel.massage!,
                state: ToastStates.ERROR,
              );
            }
          }
        },
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'REGISTER',
                          style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Register now browse our hot offers',
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 50.0,
                        ),
                        defaultFormFiled(
                          controller: nameController,
                          type: TextInputType.name,
                          validate: (String? value)
                          {
                            if(value == null ||value.isEmpty){
                              return 'Please enter your name';
                            }

                          },
                          label: 'User Name' ,
                          prefix: Icons.person,
                        ),

                        const SizedBox(
                          height: 20.0,
                        ),

                        defaultFormFiled(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (String? value){
                            if(value == null ||value.isEmpty){
                              return 'Please enter your email';
                            }
                          },
                          label: 'Email Address' ,
                          prefix: Icons.email_outlined,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),

                        defaultFormFiled(
                          suffix: ShopRegisterCubit.get(context).suffix,
                          onSubmit: (value)
                          {

                          },
                          isPassword: ShopRegisterCubit.get(context).isPassword,
                          suffixPressed: ()
                          {
                            ShopRegisterCubit.get(context).ChangePasswordVisibility();
                          },
                          controller: passwordController,
                          type: TextInputType.visiblePassword,

                          validate: (String? value){
                            if(value == null ||value.isEmpty){
                              return 'Password is too short';
                            }
                          },
                          // validate: (value){
                          //   if(value?.isEmpty){
                          //     return 'return 'Password is too short';
                          //   }
                          // },
                          label: 'Password' ,
                          prefix: Icons.lock_outline,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        defaultFormFiled(
                          controller: phoneController,
                          type: TextInputType.phone,
                          validate: (String? value){
                            if(value == null ||value.isEmpty){
                              return 'Please enter your number phone';
                            }

                          },
                          label: 'Phone' ,
                          prefix: Icons.phone,
                        ),

                        const SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopRegisterLoadingStates,
                          builder: (context)=>
                              defaultButton(
                                function: (){
                                  if(formkey.currentState!.validate()){
                                    ShopRegisterCubit.get(context).userRegister(
                                      // email: emailController.text,
                                      // password: passwordController.text,

                                       email: 'ola@gmail.com' /*emailController.text*/,
                                       name: nameController.text,
                                       password: '123456'/*passwordController.text*/,
                                       phone: phoneController.text,
                                    );
                                  }

                                },
                                text: 'register',
                                isUpperCase: true,
                              ),
                          fallback: (context)=> const Center(
                              child: CircularProgressIndicator()
                          ),

                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),



          );
        },
      ),
    );
  }
}
