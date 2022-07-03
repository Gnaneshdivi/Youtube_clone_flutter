
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

class Dataclass extends ChangeNotifier {
    Dataclass({
        required this.id,
        required this.title,
        required this.videoUrl,
        required this.coverPicture,
    });

    int id;
    String title;
    String videoUrl;
    String coverPicture;

    factory Dataclass.fromRawJson(String str) => Dataclass.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Dataclass.fromJson(Map<String, dynamic> json) => Dataclass(
        id: json["id"],
        title: json["title"],
        videoUrl: json["videoUrl"],
        coverPicture: json["coverPicture"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "videoUrl": videoUrl,
        "coverPicture": coverPicture,
    };
}
