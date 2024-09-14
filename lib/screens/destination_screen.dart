import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/destination_model.dart';

class DestinationScreen extends StatelessWidget {
  Destination? destination;

    DestinationScreen({this.destination});

  static String DESTINATION_SCREEN_ROUTE = "/destinationScreenRoute";


  @override
  Widget build(BuildContext context) {
    // final  routeArguments = ModalRoute.of(context)?.settings.arguments as Map<String, List?>;
    // final destination = routeArguments!["destination"];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
               Container(
                 height: 350,
                  width: double.infinity,
                 decoration: BoxDecoration(
                     color: Colors.red,
                     borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                     boxShadow: [BoxShadow(
                       color: Colors.black,
                       offset: Offset(0.0, 0.2),
                       blurRadius: 6.0
                     )],
                     image: DecorationImage(image: AssetImage(destination!.imageUrl!),fit: BoxFit.cover, colorFilter: ColorFilter.mode(Colors.black26, BlendMode.multiply)),
                 ),
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         Text(destination!.city!, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30, letterSpacing: 1.5),),
                         Row(

                           children: [
                             Icon(FontAwesomeIcons.locationArrow, color: Colors.grey,),
                             SizedBox(width: 10,),
                             Text(destination!.country!, style: TextStyle(color: Colors.grey, fontSize: 20),),
                           ],
                         )
                       ],
                     ),
                   ),
               ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, icon: Icon(Icons.arrow_back_ios, color: Colors.white70,)),
                    IconButton(onPressed: (){

                    }, icon: Icon(Icons.search, color: Colors.white70,)),

                  ],
                ),
              ],
            ),

            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: destination!.activities!.length,
                itemBuilder: (context, index) {
                return Container(
                 // width: double.infinity,
                  margin: EdgeInsets.all(5),
                  height: 200,
                 color: Colors.white,
                  child: Row(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 6.0),
                            ],
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(destination!.activities![index].imageUrl!, height: double.infinity,width: 150, fit: BoxFit.cover, ))),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Container(
                          //color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(destination!.activities![index].name!, style: TextStyle( letterSpacing: 1.3,fontSize: 25,fontWeight: FontWeight.bold, ),),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Text('\$${destination!.activities![index].price!}', style: TextStyle( fontSize: 25, fontWeight: FontWeight.bold, ),)),
                              Row(
                                children:
                                  List.generate(destination!.activities![index].rating!,
                                          (index) => Icon(Icons.star, color: Colors.yellow,)),

                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.amber  ,
                                      borderRadius: BorderRadius.circular(8),

                                    ),
                                    child: Text(activities![index].startTimes![0], style: TextStyle(color: Colors.white, fontSize: 20),),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.lightBlueAccent,
                                      borderRadius: BorderRadius.circular(8),

                                    ),
                                    child: Text(activities![index].startTimes![1], style: TextStyle(color: Colors.white, fontSize: 20),),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },),
            )
          ],
        ),
      ),
    );
  }
}
