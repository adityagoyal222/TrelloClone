import 'package:flutter/material.dart';
import 'package:trello_clone/screens/home/add_board.dart';
import 'package:trello_clone/screens/home/home_board.dart';
import 'package:trello_clone/screens/home/home_page.dart';
import 'package:trello_clone/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String title = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Lato',
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
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
          
        ],
      ),
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            children: <Widget>[
              Container(
                color: Colors.blue[600],
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 30, 0, 10),
                  height: 160,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 40),
                        child: CircleAvatar(
                          radius: 35,
                          child: Icon(
                            Icons.account_circle,
                            size: 35,
                          ),
                        ),
                      ),
                      Text(
                        'UserName',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Lato',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '@username',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Lato',
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                      color: title == 'Board' ? Colors.grey[200] : Colors.white,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            title = 'Board';
                            Navigator.pop(context);
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.dashboard,
                              color: title == 'Board'
                                  ? Colors.blue[600]
                                  : Colors.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                'Boards',
                                style: TextStyle(
                                  color: title == 'Board'
                                      ? Colors.blue[600]
                                      : Colors.black,
                                  fontFamily: 'Lato',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                      color: title == 'Home' ? Colors.grey[200] : Colors.white,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            title = 'Home';
                            Navigator.pop(context);
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.home,
                              color: title == 'Home'
                                  ? Colors.blue[600]
                                  : Colors.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                'Home',
                                style: TextStyle(
                                  color: title == 'Home'
                                      ? Colors.blue[600]
                                      : Colors.black,
                                  fontFamily: 'Lato',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: title == 'Board' ? HomeBoard() : HomePage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddBoard()));
        },
        backgroundColor: Colors.green[500],
        child: Icon(Icons.add),
      ),
    );
  }
}
