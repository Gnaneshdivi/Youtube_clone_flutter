import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../theme/colors.dart';

class TopBar extends StatefulWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    var dim = MediaQuery.of(context).size;
    return Container(
      color: bgcolor,
      width: dim.width,
      height: dim.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 40,bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: dim.height * 0.035,
            ),
            Iconslog(context)
          ],
        ),
      ),
    );
  }
}

Widget Iconslog(_) {
  return SizedBox(
    width: MediaQuery.of(_).size.width * 0.4,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.cast,
          color: white,
          size: MediaQuery.of(_).size.height * 0.03,
        ),
        Icon(LineIcons.bell,
            color: white, size: MediaQuery.of(_).size.height * 0.03),
        Icon(Icons.search,
            color: white, size: MediaQuery.of(_).size.height * 0.03),
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/profilepic.jpg',
                  ),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(50),
              color: Colors.blue),
          height: MediaQuery.of(_).size.height * 0.03,
          width: MediaQuery.of(_).size.height * 0.03,
        )
      ],
    ),
  );
}
