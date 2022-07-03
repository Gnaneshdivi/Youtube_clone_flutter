  
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtubeclone/pages/home.dart';
import 'package:youtubeclone/theme/colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp( MaterialApp(
    home: HomePage(),
    
    
    debugShowCheckedModeBanner: false,
     theme:  ThemeData(
        brightness: Brightness.dark,
        
      ),
    
  ));
}
