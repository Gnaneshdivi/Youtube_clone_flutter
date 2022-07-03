import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:youtubeclone/theme/colors.dart';

class TrendingBar extends StatefulWidget {
  const TrendingBar({Key? key}) : super(key: key);

  @override
  State<TrendingBar> createState() => _TrendingBarState();
}

List<String> tablist = ['all', 'Trending','Movie','Music','Language','Bangalore'];

class _TrendingBarState extends State<TrendingBar> {

  int selected=0;
  @override
  Widget build(BuildContext context) {
    
    var dim = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: dim.height * 0.05,
          color: bgcolor,
          width: dim.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
            ),
            child: Row(children: [
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  height: dim.height * 0.05,
                  width: dim.width * 0.25,
                  color: grey2,
                  child: Center(
                      child: Center(
                          child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [Icon(Icons.explore_outlined), Text('Explore')],
                  ))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Container(
                  color: greytext,
                  width: dim.width * 0.003,
                  height: dim.height * 0.03,
                ),
              ),
              Tabs(context,selected)
            ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:5.0),
          child: Container(height: MediaQuery.of(context).size.height*0.003,width: MediaQuery.of(context).size.width,color: grey2,),
        )
      ],
    );
  }
}

Widget Tabs(_,selected) {
  return Container(
    width: MediaQuery.of(_).size.width*0.67,
    child: ListView.builder(
      itemCount: tablist.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int i) {
          return Tab(tablist[i],_,selected,i);
        }),
  );
}

Widget Tab(String aa,_,selected,i) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal:5.0),
    child: GestureDetector(
      onTap: (){Scaffold.of(_).setState(() {
        selected=i;
      });},
      child: Container(  
        height: MediaQuery.of(_).size.height*0.07,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: selected==i?white:grey2),
                  child: Center(child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:10.0),
                    child: Text(aa,style: TextStyle(color: selected==i?Colors.black:white),),
                  ))),
    ),
  );
}
