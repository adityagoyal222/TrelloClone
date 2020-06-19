import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trello_clone/models/board.dart';
import 'package:trello_clone/models/user.dart';
import 'package:trello_clone/screens/home/board_list.dart';
import 'package:trello_clone/services/database.dart';
import 'package:trello_clone/shared/loading.dart';

class HomeBoard extends StatefulWidget {
  @override
  _HomeBoardState createState() => _HomeBoardState();
}

class _HomeBoardState extends State<HomeBoard> {
  
  @override
  Widget build(BuildContext context) {
    //final boards = Provider.of<List<Board>>(context) ?? [];

    User user = Provider.of<User>(context);

    DatabaseService databaseServices = DatabaseService(uid: user.uid);
    //final result = _auth.showBoard();
    Stream<List<Board>> result = databaseServices.getBoardName();
 
    return StreamProvider(
      create: (BuildContext context) => databaseServices.getBoardName(),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Personal Boards',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Lato',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
                thickness: 1,
                height: 5,
              ),
              Container(
                child: BoardList(),
              ),
            ],
          ),
        )
    );
  }
}
