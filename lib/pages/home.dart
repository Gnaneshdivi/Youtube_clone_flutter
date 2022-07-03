import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:youtubeclone/provider/datahouse.dart';
import 'package:youtubeclone/theme/colors.dart';
import 'package:youtubeclone/widgets/topbar.dart';

import '../widgets/body.dart';
import '../widgets/trendingbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  int a=0;
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Datahouse(),
      child: Scaffold(
        backgroundColor: bgcolor,
        body: SingleChildScrollView(
          child: Column(
            children: [TopBar(), TrendingBar(), Body()],
          ),
        ),
        bottomNavigationBar: CustomNavigationBar(
          strokeColor: Colors.transparent,

          backgroundColor: bgcolor,
          selectedColor: Colors.white,
          unSelectedColor: greytext,
          onTap: (x){setState(() {
            a=x;
          });},
          currentIndex: a,
        items: [
        CustomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("Home"),
          
        ),
        CustomNavigationBarItem(
          icon: Icon(Icons.videocam,),
          title: Text("Shorts"),
          
        ),
        CustomNavigationBarItem(
          icon: Icon(Icons.add_circle),
          
        ),
        CustomNavigationBarItem(
          icon: Icon(Icons.subscript),
          title: Text("Subscrtions"),
          badgeCount: 2,
          showBadge:true,
        ),
        CustomNavigationBarItem(
          icon: Icon(Icons.book_sharp),
          title: Text("Library"),
        ),
      ],
      
      )
      ),
    );
  }
}
