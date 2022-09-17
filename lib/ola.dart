import 'package:flutter/material.dart';

class OlaM extends StatelessWidget {
   var emailController=TextEditingController();
   var passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                 'Login',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
             ),
              SizedBox(
                height: 20.0,
                ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration:  InputDecoration(
                  border: OutlineInputBorder(),
                   labelText: 'Email Address',
                  prefixIcon: Icon(
                    Icons.email,
                  ),
                ),


              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                onFieldSubmitted: (value){
                  print(emailController);
                },
                onChanged: (value){
                  print(passwordController);
                },
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(
                    Icons. lock,
                  ),
                  suffixIcon: Icon(
                    Icons. remove_red_eye,
                  ),
                  border: OutlineInputBorder(),
                ),


              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                color: Colors.blue,
                width: double.infinity,
                child: MaterialButton(
                    onPressed: (){

                    },
                     child: Text(
                       'LOGIN',
                       style: TextStyle(
                         fontSize: 20.0,
                         color: Colors.white,
                       ),
                     ),
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      Text(
                        'Don\'t have account?',
                        ),
                      TextButton(onPressed: (){},
                          child:
                             Text(
                               'Register Now',

                             ),
                      ),





                  ],
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
