import 'package:feedgram/feed_list.dart';
import 'package:flutter/material.dart';

class FeedBody extends StatelessWidget {
  final datas;
  FeedBody(this.datas);

  
  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Flexible(
          child: FeedList(datas),
        )
      ],
    );
  }
}