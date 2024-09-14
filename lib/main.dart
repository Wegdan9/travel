import 'package:flutter/material.dart';
import 'package:travel/screens/destination_screen.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Travel",
      theme: ThemeData(
          primaryColor: Color(0xFF3EBACE),
          accentColor: Color(0xFFD8ECF1),
          scaffoldBackgroundColor: Color(0xFFF3F5F7)),
      home: HomeScreen(),
      routes: {
      DestinationScreen.DESTINATION_SCREEN_ROUTE: (context) =>DestinationScreen()
      },
    );
  }
}
