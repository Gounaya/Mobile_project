import 'package:flutter/material.dart';
import 'src.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class LikedImages extends StatefulWidget {

  @override
  _LikedImagesState createState() => _LikedImagesState();
}

class _LikedImagesState extends State<LikedImages> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text("Liked Images"),
            elevation: 0.0,
        ),
    );
  }
}
