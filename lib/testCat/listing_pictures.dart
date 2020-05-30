import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobileproject/testCat/liked_images.dart';
import 'Cat.dart';
import 'src.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class ListingPictures extends StatefulWidget {

  @override
  _ListingPicturesState createState() => _ListingPicturesState();
}

class _ListingPicturesState extends State<ListingPictures> {
  final _catsRepository = CatsRepository.instance;


  var isLiked = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("List of cats"),
          elevation: 0.0, //we dont
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: IconButton(
                icon: Icon(Icons.favorite, color: Colors.white,),
                onPressed: (){

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => LikedImages()
                    ),
                  );


                },
              ),
            ),
          ]
      ),
        body: FutureBuilder(
            future: _catsRepository.getCats(),
            builder: (BuildContext context, AsyncSnapshot<List<Cat>> cat) {
              if(cat.hasData){
                List<Cat> items = cat.data;
                return ListView.separated(
                    itemBuilder: (context, position) {
                      return Center(
                        child: Stack(
                          children: <Widget>[
                            Card(
                              elevation: 7.0,
                              child: Container(
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height / 2,
                                margin: EdgeInsets.only(top: 0),
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 1,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(items
                                          .elementAt(position)
                                          .url),
                                      fit: BoxFit.cover
                                  ),
                                ),
                              ),
                            ),
                            ListTile(
                              leading: IconButton(
                                  icon: isLiked ? Icon(Icons.favorite) : Icon(
                                      Icons.favorite_border),
                                  iconSize: 30,
                                  color: Colors.red,
                                  onPressed: () {
                                    isLiked = !isLiked;
                                  }
                              ),
                            )
                          ],
                        ),
                      );
                    }
                );
              } else {
                return CircularProgressIndicator();
              }
            }
        )

    );
  }
}




class Characterprovider {

  Future<Response> getCats() async {
    var dio = Dio();
    dio.options.headers["x-api-key"] = "67d0d2df-bf7f-413e-b8ea-323eb0b12638";
    Response catsResponse = await dio.get("https://api.thecatapi.com/v1/images/search?limit=10");
    debugPrint(catsResponse.data.toString());
    return catsResponse;
  }
}

class CatsRepository{
  CatsRepository._privateConstructor();
  static final CatsRepository _instance = CatsRepository._privateConstructor();
  static CatsRepository get instance => _instance;

  Future<List<Cat>> getCats() async {
    Response response = await Characterprovider().getCats();
    if(response.data is List){
      List data = response.data;
      List<Cat> cats = data.map((object) => Cat.fromJson(object)).toList();
      return cats;
    } else if(response.statusCode == 204){
      return null;
    } else {
      print("cats repository");
    }
  }
}