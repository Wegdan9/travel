import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel/models/destination_model.dart';
import 'package:travel/screens/destination_screen.dart';

class DestinationCarousel extends StatelessWidget {
  const DestinationCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Top Destination',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 30.0,
                  letterSpacing: 1.3,
                  fontWeight: FontWeight.bold),
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'See All',
                  style: TextStyle(
                      fontSize: 20.0, color: Theme.of(context).primaryColor),
                ))
          ],
        ),
        Container(
          height: 300.0,
          //color: Colors.blue,
          child: ListView.builder(
            itemCount: destinations.length,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                    // Navigator.pushNamed(context, DestinationScreen.DESTINATION_SCREEN_ROUTE, arguments: {
                    //    "destination": [destinations[index].city, destinations[index].imageUrl, destinations[index].country, destinations[index].activities!.length],
                    // }
                    // );
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DestinationScreen(destination: destinations[index]),));
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  width: 200,
                  //color: Colors.white,
                decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width:double.infinity,
                        height: 200,
                        padding: EdgeInsets.all(5),
                        //alignment: Alignment.bottomLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(destinations[index].imageUrl!),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.black26, BlendMode.multiply)),
                            boxShadow: [
                              BoxShadow(color: Colors.black26,
                                  offset: Offset(0.0, 3.0),
                                  blurRadius: 2
                              ),
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(destinations[index].city!, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 1.3, color: Colors.white)),
                            Row(children: [
                              Icon(FontAwesomeIcons.locationArrow, color: Colors.grey,),
                              SizedBox(width: 8,),
                              Text(destinations[index].country!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),)
                            ],)
                          ],
                        ),
                      ),
                      Text('${destinations[index].activities!.length} activities', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.3, fontSize: 30),),
                      Text(destinations[index].description!, style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
