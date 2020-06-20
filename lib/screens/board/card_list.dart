import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trello_clone/models/board.dart';
import 'package:trello_clone/models/user.dart';
import 'package:trello_clone/services/database.dart';

class CardList extends StatefulWidget {

  final String boardName;
  final String listName;

  CardList({this.boardName, this.listName});
  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {

  String cardName;
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    List cardsList = Provider.of<List<Cards>>(context);
    if (cardsList != null) {
      cardsList = List.from(cardsList.reversed);
    }

    return (cardsList == null || cardsList.isEmpty) ? Container() : ListView.builder(
      itemCount: cardsList.length,
      itemBuilder: (_, int index) => Container(
        height: 60,
        margin: EdgeInsets.all(10),
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(cardsList[index].cardName,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Lato',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),),
              ),
              IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  DatabaseService(uid: user.uid).deleteCard(widget.boardName, widget.listName, cardsList[index].cardName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}