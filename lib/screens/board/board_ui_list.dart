
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trello_clone/models/board.dart';
import 'package:trello_clone/screens/board/add_card.dart';
import 'package:trello_clone/screens/board/add_list.dart';
import 'package:trello_clone/screens/board/card_stream.dart';

class BoardUIList extends StatefulWidget {
  final String boardName;
  BoardUIList({this.boardName});

  @override
  _BoardUIListState createState() => _BoardUIListState();
}

class _BoardUIListState extends State<BoardUIList> {
  String listName;

  @override
  Widget build(BuildContext context) {
    List listsList = Provider.of<List<Lists>>(context);
    if (listsList != null) {
      listsList = List.from(listsList.reversed);
    }

    return listsList == null
        ? Container()
        : ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listsList.length + 1,
            itemBuilder: (_, int index) {
              if (index == listsList.length) {
                return Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 500),
                  width: 275,
                  height: 60,
                  child: GestureDetector(
                    onTap: () {
                      print(widget.boardName);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AddList(boardName: widget.boardName)));
                    },
                    child: Container(
                      child: Card(
                        child: Container(
                          child: Center(
                            child: Text(
                              'Add List',
                              style: TextStyle(
                                color: Colors.green[600],
                                fontFamily: 'Lato',
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        elevation: 2.0,
                      ),
                    ),
                  ),
                );
              } else {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Card(
                      margin: EdgeInsets.fromLTRB(20, 15, 0, 0),
                      elevation: 2.0,
                      child: Container(
                        
                        width: 275,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Material(
                              elevation: 5.0,
                              child: Container(
                                width: 275,
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  listsList[index].listName,
                                ),
                              ),
                            ),
                            CardStream(boardName: widget.boardName, listName: listsList[index].listName,),
                            Container(
                              child: GestureDetector(
                                onTap: () {
                                  print(widget.boardName);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddCard(
                                              boardName: widget.boardName, listName: listsList[index].listName,)));
                                },
                                child: Card(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 20),
                                    child: Center(
                                      child: Text(
                                        'Add Card',
                                        style: TextStyle(
                                          color: Colors.green[600],
                                          fontFamily: 'Lato',
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
          );
  }
}
