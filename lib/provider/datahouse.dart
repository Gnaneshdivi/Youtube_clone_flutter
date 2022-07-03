import 'package:flutter/material.dart';
import 'package:youtubeclone/json/data.dart';

class Datahouse extends ChangeNotifier{
var mediadata=data;
int play=0;
updateplay(int x){
  play=x;
  notifyListeners();
}

}