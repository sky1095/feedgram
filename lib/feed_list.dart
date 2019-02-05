import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_simple_video_player/flutter_simple_video_player.dart';


class FeedList extends StatelessWidget {
  final datas;
  FeedList(this.datas);  

  @override
  Widget build(BuildContext context) {
    // deviceSize = MediaQuery.of(context).size;
    return new ListView.builder(
        itemCount: this.datas != null ? this.datas.length : 0,
        itemBuilder: (context, index) {
          final data = this.datas[index];
          String imageUrl = data["poster"]["userimage"];
          String mediaLink = data["medialink"];
          String name = data["poster"]["fullname"];
          String title = data["title"];
          String desp = data["description"];
          String mediaType = data["mediatype"];
         
          //bool isPlaying = false;
          return new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        new Container(
                          height: 40.0,
                          width: 40.0,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new NetworkImage(imageUrl))),
                        ),
                        new SizedBox(
                          width: 10.0,
                        ),
                        new Text(name,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        new Container(
                          width: 4.0,
                        ),
                      ],
                    ),
                    new IconButton(
                      icon: Icon(Icons.more_vert),
                      onPressed: null,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 4.0, 0, 8.0),
                child: Row(
                  children: <Widget>[
                    new Text(title, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 10.0)),
                  ],
                ),
              ),
              mediaType == "photo"? 
              Flexible(
                fit: FlexFit.loose,
                child: new Image.network(
                  mediaLink,
                  fit: BoxFit.contain,
                ),
              )
              :
              Flexible(
                fit: FlexFit.loose,
                child: new NetVideo(mediaLink)
              ),
              
              //3rd Row
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Icon(
                          FontAwesomeIcons.heart,
                        ),
                        new SizedBox(
                          width: 16.0,
                        ),
                        new Icon(
                          FontAwesomeIcons.comment,
                        ),
                        new SizedBox(
                          width: 16.0,
                        ),
                        new Icon(FontAwesomeIcons.paperPlane),
                      ],
                    ),
                    new Icon(FontAwesomeIcons.bookmark)
                  ],
                ),
              ),
              //Extra Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: <Widget>[
                   new  Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                   new Container(
                     width: 4.0,
                   ),
                   new  Text(desp, style: TextStyle(fontWeight: FontWeight.normal))
                  ],
                )
              ),
              //4th Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Liked by sudhanshu, sky and 10 others",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              // 5th Row
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new NetworkImage(
                                  "https://media.licdn.com/dms/image/C5103AQG-6ButhpLs-Q/profile-displayphoto-shrink_200_200/0?e=1548892800&v=beta&t=au_XDJSM9xUhpvVxjj15kVdE2CTiw0Q7jNrl-MBilvQ"))),
                    ),
                    new SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: new TextField(
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            hintText: "Add a comment..."),
                      ),
                    )
                  ],
                ),
              ),

              //6th Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "1 Day Ago",
                  style: TextStyle(color: Colors.grey),
                ),
              )
            ],
          );
        }
    );
  }
}

// class VideoPlay extends StatelessWidget {
//   final String url;
//   VideoPlay({this.url});
//   @override
//   Widget build(BuildContext context) {
//     return WebviewScaffold(
//       url: url,
//     );
//   }
// }

