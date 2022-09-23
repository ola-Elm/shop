import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/layout/shop_app/shop_layout.dart';
import 'package:flutterapp/modules/shop_app/login/cubit/cubit.dart';
import 'package:flutterapp/modules/shop_app/login/cubit/states.dart';
import 'package:flutterapp/modules/shop_app/register/shop_register_screen.dart';
import 'package:flutterapp/shared/components/components.dart';
import 'package:flutterapp/shared/components/conestant.dart';
import 'package:flutterapp/shared/network/local/cache_helper.dart';


class ShopLoginScreen extends StatelessWidget {

  var formkey= GlobalKey<FormState>();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {

   return BlocProvider(
      create: (BuildContext context) =>ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit,ShopLoginStates>(
          listener: (context,state){
            if(state is ShopLoginSuccessStates){
               if(state.loginModel.status!){
                  print('----------- ${state.loginModel.massage}');
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
                  //هنا===>>>> اثبت مكانك و غير واظهرلو عللى السكرينة
                 //////////////
                 print(state.loginModel.massage);
                  showToast(
                      text: state.loginModel.massage!,
                      state: ToastStates.ERROR,
                  );
                }
            }
          },
          builder: (context,state)
          {
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
                            'LOGIN',
                            style: Theme.of(context).textTheme.headline4?.copyWith(
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'login now browse our hot offers',
                            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            height: 50.0,
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
                            suffix:  ShopLoginCubit.get(context).suffix,
                            onSubmit: (value){
                              if(formkey.currentState!.validate()){
                                ShopLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            isPassword: ShopLoginCubit.get(context).isPassword,
                            suffixPressed: (){
                              ShopLoginCubit.get(context).ChangePasswordVisibility();
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
                          ConditionalBuilder(
                            condition: (state != ShopLoginLoadingStates),
                            builder: (context)=>
                                defaultButton(
                              function: (){
                                if(true/*formkey.currentState!.validate()*/){
                                  ShopLoginCubit.get(context).userLogin(
                                    email: 'ola@gmail.com' /*emailController.text*/,
                                    password: '123456'/*passwordController.text*/,
                                  );
                                }

                              },
                              text: 'login',
                              isUpperCase: true,
                            ),
                            fallback: (context)=> const Center(
                                child: CircularProgressIndicator()
                            ),

                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Don\'t have an account ?',
                              ),

                             // TextButton(
                             //     onPressed: ()
                             //     {
                             //       navigateTo(context, ShopLayout());
                             //     },
                             //     child: const Text('Regester',),),



                               defaultTextButton(
                                function:  (){
                                  ShopRegisterScreen();
                                },
                                text: 'register',
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
