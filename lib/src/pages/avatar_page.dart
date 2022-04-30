import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar'),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://scontent-bog1-1.xx.fbcdn.net/v/t1.6435-9/71846826_2322497151192881_7627601165936492544_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=174925&_nc_ohc=lcDkNpB92AEAX80425A&tn=-aguXQhuz6GSbyLf&_nc_ht=scontent-bog1-1.xx&oh=092087999d89889c047024aafb131d73&oe=61518DDD'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('MR'),
              backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
