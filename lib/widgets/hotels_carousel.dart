import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel/models/destination_model.dart';
import 'package:travel/models/hotel_model.dart';

class HotelsCarousel extends StatelessWidget {
  const HotelsCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Exclusive Hotels',
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
          height: 280.0,
          //color: Colors.blue,
          child: ListView.builder(
            itemCount: hotels.length,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(5),
                width: 200,
                //color: Colors.white,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width:double.infinity,
                      height: 200,
                      padding: EdgeInsets.all(5),
                      //alignment: Alignment.bottomLeft,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage(hotels[index].imageUrl!),
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
                          Text(hotels[index].name!, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 1.3, color: Colors.white)),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text('\$${hotels[index].price!} / Night', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black87),),
                    Text(hotels[index].address!.toString(), style: TextStyle(color: Colors.grey),)
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
