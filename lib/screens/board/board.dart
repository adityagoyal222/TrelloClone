import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trello_clone/models/board.dart';
import 'package:trello_clone/models/user.dart';
import 'package:trello_clone/screens/board/board_ui_list.dart';
import 'package:trello_clone/services/database.dart';

class BoardUI extends StatefulWidget {
  final String boardName;

  BoardUI({this.boardName});

  @override
  _BoardUIState createState() => _BoardUIState();
}

class _BoardUIState extends State<BoardUI> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    DatabaseService databaseServices = DatabaseService(uid: user.uid);
    Stream<List<Lists>> result = databaseServices.getListName(widget.boardName);

    return StreamProvider(
      create: (BuildContext context) => result,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context)),
          title: Text(widget.boardName),
          backgroundColor: Colors.blue[600],
          actions: <Widget>[
            Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.search,
                size: 26.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.notifications),
            ),
          ),
          ],
        ),
        body: Container(color: Colors.blue[300], child: BoardUIList(boardName: widget.boardName,)),
      ),
    );
  }
}
