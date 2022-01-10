// @dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'fadeAnimation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Nunito",
      ),
      home: MyHomePage(),
    );
  }
}



class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  PageController pageController;
  @override
  void dispose() {
    pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
          body: PageView(
            controller: pageController,
        children: [
          Page(
            image: "one.jpg",
            title: 'Yosemite National Park',
            description: 'Yosemite National Park is in California’s Sierra Nevada mountains. It’s famed for its giant, ancient sequoia trees, and for Tunnel View, the iconic vista of towering Bridalveil Fall and the granite cliffs of El Capitan and Half Dome.',
            pageNo: "1",
          ),
          Page(
            image: "two.jpg",
            title: 'Golden Gate Bridge',
            description: 'The Golden Gate Bridge is a suspension bridge spanning the Golden Gate, the one-mile-wide strait connecting San Francisco Bay and the Pacific Ocean.',
            pageNo: '2',
          ),
          Page(
            image: 'three.jpg',
            title: 'Sedona',
            description: "Sedona is regularly described as one of America's most beautiful places. Nowhere else will you find a landscape as dramatically colorful.",
            pageNo: '3',
          ),
          Page(
            image: 'four.jpg',
            title: 'Savannah',
            description: "Savannah, with its Spanish moss, Southern accents and creepy graveyards, is a lot like Charleston, South Carolina. But this city about 100 miles to the south has an eccentric streak.",
            pageNo: "4",
          )


        ],
      )
          ),
    );
  }
}

class Page extends StatelessWidget {
  Page({this.image,this.pageNo,this.title,this.description});
  String image,pageNo,title,description;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/"+image),
              fit: BoxFit.cover)),
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    FadeAnimation(delay: 0.5,child: Text(
                      pageNo,
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),),
                    Text(
                      "/4",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeAnimation(delay: 1,child:  Text(
                  title,
                  style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),),
                SizedBox(
                  height: 10,
                ),
                FadeAnimation(delay: 1.5,child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 17,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 17,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 17,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 17,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.grey,
                      size: 17,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "4.0",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white70),
                    ),
                    Text(
                      "(2000)",
                      style:
                      TextStyle(color: Colors.white38, fontSize: 12),
                    )
                  ],
                ),),
                SizedBox(
                  height: 15,
                ),
                FadeAnimation(delay: 2,child: Text(
                  description,
                   style: TextStyle(
                      color: Colors.white.withOpacity(.7),
                      height: 1.9,
                      fontSize: 15),
                ),),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(delay: 2.5,child:
                Text(
                  "READ MORE",
                  style: TextStyle(color: Colors.white),
                ),),
                SizedBox(
                  height: 30,
                ),
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
            gradient:
                LinearGradient(begin: Alignment.bottomRight, stops: [
          0.3,
          0.9
        ], colors: [
          Colors.black.withOpacity(.9),
          Colors.black.withOpacity(.2),
        ])),
      ),
    );
  }
}
