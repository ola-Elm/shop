import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutterapp/modules/bmi_app/bmi_result/bmi_result_screen.dart';

class BmiScreen extends StatefulWidget {

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}


class _BmiScreenState extends State<BmiScreen> {
  bool isMale=true;
  double Heigt=120.0;
  int weight=40;
  int age=20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculate',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState((){
                             isMale=true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0,),
                            color:isMale? Colors.blue:Colors.grey[400],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               //Image(
                                // image:AssetImage('assets/imeges/male.png'),
                                // width: 90.0,
                                // height: 90.0,
                               //),
                               SizedBox(
                                 height: 30.0,
                               ),
                              Text(
                                'Male',
                                style: TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                           setState(()
                           {
                             isMale=false;
                           }
                           );
                          },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0,),
                            color:!isMale? Colors.blue:Colors.grey[400],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             // Image(
                               // image:AssetImage('assets/imeges/female.png'),
                               // width: 90.0,
                               // height: 90.0,
                              //),
                              SizedBox(
                                height: 30.0,
                              ),
                              Text(
                                'FEMale',
                                style: TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10.0,),
                     color: Colors.grey[400],

                   ),

                  child: Column(

                    children: [
                      Text(
                        'HIGHT',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                       textBaseline: TextBaseline.alphabetic,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text(
                           '${Heigt.round()}',
                           style: TextStyle(
                             fontSize: 50.0,
                             fontWeight: FontWeight.w900,
                             color: Colors.black,
                           ),
                         ),
                         SizedBox(
                           width: 7.0,
                         ),
                         Text(
                           'cm',
                           style: TextStyle(
                             fontSize: 30.0,
                             color: Colors.black,
                           ),
                         ),
                       ],
                     ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Slider(
                          value: Heigt,
                          max: 220.0,
                          min: 80.0,
                          onChanged: (value){
                            setState((){
                              Heigt=value;
                            });
                            print(value.round());
                          }
                      ),


                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0,),
                          color: Colors.grey[400],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'weight',
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '$weight',
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.black,
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                  FloatingActionButton(
                                    mini: true,
                                    backgroundColor: Colors.blue,
                                    onPressed: (){

                                      setState((){
                                        weight--;
                                      });
                                    },
                                    heroTag: 'weight-',
                                    child: Icon(
                                      Icons.remove,
                                    ),


                                  ),
                                  FloatingActionButton(
                                    mini: true,
                                    backgroundColor: Colors.blue,
                                    onPressed: (){
                                      setState((){
                                        weight++;
                                      });
                                    },
                                    heroTag: 'weight+',
                                    child: Icon(
                                      Icons.add,
                                    ),



                                  ),
                                ],
                              ),
                            ),


                         ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0,),
                          color: Colors.grey[400],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '$age',
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.black,
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    mini: true,
                                    backgroundColor: Colors.blue,
                                    onPressed: (){
                                      setState((){
                                        age--;
                                      });
                                    },
                                    heroTag: 'age-',
                                    child: Icon(
                                      Icons.remove,
                                    ),


                                  ),
                                  FloatingActionButton(
                                    mini: true,
                                    backgroundColor: Colors.blue,
                                    onPressed: (){
                                      setState((){
                                        age++;
                                      });
                                    },
                                    heroTag: 'age+',
                                    child: Icon(
                                      Icons.add,
                                    ),



                                  ),
                                ],
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width:double.infinity,
              color: Colors.blue,
              child: MaterialButton(
                onPressed: (){

                  double result=weight / pow(Heigt/100, 2);
                  print(result.round());

                   Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context)=> BmiResultScreen(
                      age: age,
                      isMale: isMale,
                      result: result.round(),
                    ),
                  ),
                  );
                },
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}
