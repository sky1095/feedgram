import 'package:feedgram/feed_body.dart';
// import 'package:feedgram/feed_stories.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class FeedHome extends StatefulWidget {
  
  @override
  FeedHomeState createState() {
    return new FeedHomeState();
  }
}

class FeedHomeState extends State<FeedHome> {
  final topBar  = new AppBar(
    backgroundColor: new Color(0xfff8faf8),
    centerTitle: true,
    elevation: 1.0,
    leading: new Icon(Icons.camera_alt),
    title: SizedBox(
      height: 35.0, child: Image.asset("assets/images/feed_logo.png"),
    ),
    actions: <Widget>[
      Padding(padding: const EdgeInsets.only(right: 12.0),
              child: Icon(Icons.send),
      )
    ],
  );

  var datas;
  
  _fetchData() async {
    final url = "JSON Address";
    final response = await http.get(url);
    if (response.statusCode == 200){
      //print(response.body);

      final map = json.decode(response.body);
      final dataJson = map["data"];
      //print(dataJson);
      // dataJson.forEach((data){
      //   print(data["poster"]["fullname"]);
      // });
      
      setState(() {
      this.datas = dataJson;
      
            });      
    }
    
  } 

  Future<Null> refreshFeed() async {
    await Future.delayed(Duration(seconds: 10));
    setState(() {
          new FeedBody(datas);
          _fetchData();
        });
        return null;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: topBar,
      body: RefreshIndicator(
        child: new FeedBody(datas),
        onRefresh: refreshFeed,
      ),
      bottomNavigationBar: new Container(
        color: Colors.white,
        height: 50.0,
        alignment: Alignment.center,
        child: new BottomAppBar(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new IconButton(
                icon: Icon(
                  Icons.home,
                ),
                onPressed: (){
                  _fetchData();                  
                },
              ),
              new IconButton(
                icon: Icon(
                  Icons.search,
                ),
                onPressed: null,
              ),
              new IconButton(
                icon: Icon(
                  Icons.add_box,
                ),
                onPressed: null,
              ),
              new IconButton(
                icon: Icon(
                  Icons.favorite,
                ),
                onPressed: null,
              ),
              new IconButton(
                icon: Icon(
                  Icons.account_box,
                ),
                onPressed: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
