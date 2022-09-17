import 'package:flutter/material.dart';
import 'package:flutterapp/shared/components/components.dart';

// reusable components
// اعادة استخدامه
// 1. timing
// 2. refactor
// 3. quality
//4. clean code

class LoginScreen  extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formkey= GlobalKey<FormState>();

  bool isPassword= true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defaultFormFiled(
                    controller:emailController ,
                    label: 'Email Address',
                    prefix: Icons.email,
                    type: TextInputType.emailAddress,
                     validate: (   value){
                      if(value!.isEmpty){
                        return 'must not be empty';
                      }
                      return null;
                    },

                  ),
                  SizedBox(
                    height: 15.0,
                  ),

                defaultFormFiled(
                isPassword: isPassword,
                controller:passwordController ,
                label: 'Password Address',
                prefix: Icons.lock,
                suffix: isPassword ? Icons.visibility: Icons.visibility_off,
                 suffixPressed: (){
                   setState((){
                     isPassword= !isPassword;
                   });
                 },
                type: TextInputType.visiblePassword,
                 validate: (value){
                  if(value!.isEmpty){
                    return 'password is too short';
                  }
                  return null;
                },

              ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                      // width: 200.0 ,
                      function: (){
                        if(formkey.currentState!.validate()){

                          print(emailController.text);
                          print(passwordController.text);

                        }

                      },
                      //background: Colors.blue,
                      // background: Colors.blue,
                        text: 'Login',
                    //radius: 10.0,

                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                   // width: 200.0 ,
                    function: (){
                      print(emailController.text);
                      print(passwordController.text);
                    },
                    //background: Colors.blue,
                    //background: Colors.blue,
                    text: 'ReGeStEr',
                   // radius: 30.0,
                    //isUpperCase: false,
                  ),

                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          'Don\'t have an account?'
                      ),
                      TextButton(onPressed: (){},
                        child:Text(
                            'Register Now'
                        ),),
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
}