import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trello_clone/models/board.dart';
import 'dart:math' as math;

import 'package:trello_clone/screens/board/board.dart';
// import 'package:trello_clone/models/user.dart';

class BoardList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //User user = Provider.of<User>(context);
    List boardList = Provider.of<List<Board>>(context);
    //DatabaseService databaseServices = DatabaseService(uid: user.uid);

    return Flexible(
      child: ListView.builder(
        itemCount: boardList.length,
        itemBuilder: (_, int index) => Padding(
          padding: EdgeInsets.fromLTRB(5.0, 0, 10, 0),
          child: ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BoardUI(boardName: boardList[index].boardName)));
            },
            leading: CircleAvatar(
              radius: 15,
              backgroundColor: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
            ),
            title: Text(
                boardList[index].boardName,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                ),
              ),
              ),
          ),
      ),
    );
  }
}