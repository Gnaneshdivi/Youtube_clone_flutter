import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:youtubeclone/json/data.dart';
import 'package:youtubeclone/provider/datahouse.dart';
import 'package:youtubeclone/theme/colors.dart';
import 'package:youtubeclone/widgets/video.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  
  @override
  Widget build(BuildContext context) {
     var data=Provider.of<Datahouse>(context,listen: true);
      ScrollController _controller = ScrollController();
      var aa=0;
  
    
    return Container(
      color: bgcolor,
      height: MediaQuery.of(context).size.height,
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: false,
        child: NotificationListener(onNotification: (notification) {
    if (notification is ScrollEndNotification) {
      data.updateplay((((_controller.position.pixels.round())/340)+1).round());
      print((((_controller.position.pixels.round())/340)+1).round());
    }
    return false;
  },
          child: ListView.builder(
            controller: _controller,
              shrinkWrap: true,
              itemCount: data.mediadata.length,
              itemBuilder: (BuildContext context, int i) {
                return MediaCard( i: i);
              }),
        ),
      ),
    );
  }
}
