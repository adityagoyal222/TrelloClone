import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trello_clone/models/board.dart';
import 'package:trello_clone/models/user.dart';
import 'package:trello_clone/screens/board/card_list.dart';
import 'package:trello_clone/services/database.dart';

class CardStream extends StatefulWidget {
  final String boardName;
  final String listName;

  CardStream({this.boardName, this.listName});

  @override
  _CardStreamState createState() => _CardStreamState();
}

class _CardStreamState extends State<CardStream> {
  @override
  Widget build(BuildContext context) {

    User user = Provider.of<User>(context);

    DatabaseService databaseServices = DatabaseService(uid: user.uid);
    Stream<List<Cards>> result = databaseServices.getCardName(widget.boardName, widget.listName);

    return StreamProvider(
      create: (BuildContext context) => result,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        color: Colors.grey[300],
        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height - 270,
                        ),
        child: CardList(boardName: widget.boardName, listName: widget.listName,),
      ),
    );
  }
}