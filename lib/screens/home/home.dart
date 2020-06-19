import 'package:flutter/material.dart';
import 'package:trello_clone/screens/home/add_board.dart';
import 'package:trello_clone/screens/home/home_board.dart';
import 'package:trello_clone/screens/home/home_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String title = 'Board';

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
              )),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(Icons.notifications),
              )),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[],
        ),
      ),
      body: HomeBoard(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddBoard()));
        },
        backgroundColor: Colors.green[500],
        child: Icon(Icons.add),
      ),
    );
  }
}
