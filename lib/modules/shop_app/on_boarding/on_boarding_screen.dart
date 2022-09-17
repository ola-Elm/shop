import 'package:flutter/material.dart';
import 'package:flutterapp/modules/shop_app/login/shop_login_screen.dart';
import 'package:flutterapp/shared/components/components.dart';
import 'package:flutterapp/shared/network/local/cache_helper.dart';
import 'package:flutterapp/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel{
  late String image;
  late String title;
  late String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
});


}

class OnBoardingScreen extends StatefulWidget {


  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController= PageController();

  List<BoardingModel> boarding =[
    BoardingModel(
        image: 'assets/images/onboard1.jpg',
        title: 'On Boarder 1 Title',
        body: 'On Boarder 1 Body',
    ),
    BoardingModel(
      image: 'assets/images/onboard1.jpg',
      title: 'On Boarder 2 Title',
      body: 'On Boarder 2 Body',
    ),
    BoardingModel(
      image: 'assets/images/onboard1.jpg',
      title: 'On Boarder 3 Title',
      body: 'On Boarder 3 Body',
    ),
  ];

  bool isLast= false;//لما اوصل للاخر

   void submit(){
       ChaseHelper.saveData (
         key: 'onBoardingScreen',
         value: true,
     ).then((value)
     {
       if(value){
         navigateAndFinish(
           context,
           ShopLoginScreen(),
         );
       }
     });
   }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
         actions: [
           // TextButton(
           //   onPressed: ()
           //   {
           //     submit();
           //     //navigateAndFinish(context, ShopLoginScreen());
           //   },
           //     child: Text('Skip'),
           // ),
           defaultTextButton(
               function:  (){
                 submit();
               },
               text: 'skip',
           ),
         ],
       ),
       body: Padding(
         padding: const EdgeInsets.all(30.0),
         child: Column(
           children: [
             Expanded(
               child: PageView.builder(
                 physics: const BouncingScrollPhysics(),
                 controller: boardController,
                 itemBuilder: (context,index) => buildBoardingItem(boarding[index]),
                 onPageChanged: (int index){
                   if(index == boarding.length-1){
                    setState((){
                      isLast =true;
                    });
                    print('Last List');
                   } else{
                     print('Not Last List');
                     setState((){
                       isLast =false;
                     });
                   }
                 },
                 itemCount: boarding.length,
               ),
             ),
             const SizedBox(
               height: 40.0,
             ),
             Row(
               children:
               [
                  SmoothPageIndicator(
                      controller: boardController,
                      effect: const ExpandingDotsEffect(
                        activeDotColor: defaultColor,
                        dotColor: Colors.grey,
                        dotHeight: 10,
                        expansionFactor: 4,
                        dotWidth: 10,
                        spacing: 5.0,
                      ),
                      count: boarding.length,
                  ),
                 const Spacer(),
                 FloatingActionButton(
                    onPressed: ()
                    {
                      if(isLast)
                      {
                        submit();
                      }
                      else
                      {
                    boardController.nextPage(
                    duration: const Duration(
                    milliseconds: 750,
                    ),
                    curve: Curves.fastLinearToSlowEaseIn,
                    );
                    }
                    },
                   child: const Icon(
                     Icons.arrow_forward_ios,

                   ),


                 ),

               ],

             )


           ],
         ),
       ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:   [
      Expanded(
        child: Image(
          image: AssetImage('${model.image}'),
        ),
      ),
      Text(
        '${model.title}',
        style: const TextStyle(
          fontSize: 24.0,
        ),
      ),
      const SizedBox(
        height: 20.0,
      ),
      Text(
        '${model.body}',
        style: const TextStyle(
          fontSize: 14.0,
        ),
      ),
      const SizedBox(
        height: 20.0,
      ),
    ],


  );
}
