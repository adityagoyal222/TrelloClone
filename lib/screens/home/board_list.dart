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
        itemCount: boardList == null ? 0 : boardList.length,
        itemBuilder: (_, int index) => Padding(
          padding: EdgeInsets.fromLTRB(5.0, 0, 10, 0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          BoardUI(boardName: boardList[index].boardName, )));
            },
            child: ListTile(
              leading: Container(
                width: 40.0,
                height: 40.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                        .withOpacity(1.0),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(2.0)),
                  ),
                ),
              ),
              title: Text(
                boardList[index].boardName,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
