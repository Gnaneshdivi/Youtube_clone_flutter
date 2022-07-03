import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:youtubeclone/provider/datahouse.dart';
import 'package:youtubeclone/theme/colors.dart';
import 'package:chewie/chewie.dart';

import '../provider/dataclass.dart';

class MediaCard extends StatefulWidget {
  final int i;
  const MediaCard({Key? key, required this.i}) : super(key: key);

  @override
  State<MediaCard> createState() => _MediaCardState();
}

class _MediaCardState extends State<MediaCard> {
  @override
  Widget build(BuildContext context) {
    var aa = Provider.of<Datahouse>(context, listen: false);
    Dataclass data = Dataclass.fromJson(aa.mediadata[widget.i]);
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
          height: MediaQuery.of(context).size.height * 0.38,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Video(data: data),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/profilepic.jpg',
                                ),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.blue),
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.height * 0.05,
                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  data.title,
                                  style: TextStyle(fontSize: 20),
                                  overflow: TextOverflow.clip,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Minion . ',
                                  style: TextStyle(color: greytext),
                                ),
                                Text('2M views . ',
                                    style: TextStyle(color: greytext)),
                                Text('2 days ago',
                                    style: TextStyle(color: greytext))
                              ],
                            )
                          ],
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    Icon(Icons.more_vert),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

class Video extends StatefulWidget {
  final Dataclass data;
  const Video({Key? key, required this.data}) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  bool playing = false;
  var videoPlayerController;
  var chewieController;
  var playerWidget;
  @override
  Future<void> abc() async {

    videoPlayerController = VideoPlayerController.network(widget.data.videoUrl);
    await videoPlayerController.initialize();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
    );
    playerWidget = Chewie(
      controller: chewieController,
    );
   
    
  
  }
   void killVidPlayer() {
    setState(() {

    });

     videoPlayerController.dispose();
    chewieController.dispose();
}

  @override
  void dispose() {
    videoPlayerController.dispose();
       chewieController.dispose();
    
   
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<Datahouse>(context, listen: true);
    if (widget.data.id == Provider.of<Datahouse>(context).play) {
      playing = true;
    } else {
      playing = false;
    }

    return FutureBuilder(
      future: abc(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.28,
          width: MediaQuery.of(context).size.width,
          color: bgcolor,
          child: playing
              ? playerWidget
              : MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  removeBottom: true,
                  child: Image.network(widget.data.coverPicture,
                      height: MediaQuery.of(context).size.height * 0.28,
                      width: MediaQuery.of(context).size.width)),
        );
      }
    );
  }
}
